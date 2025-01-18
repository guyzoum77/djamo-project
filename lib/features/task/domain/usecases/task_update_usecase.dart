import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

class TaskUpdateUseCase implements UseCase<List<UpdateTaskParams>, UpdateTaskParams> {
  final TaskRepository taskRepository;

  const TaskUpdateUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, List<UpdateTaskParams>>> call(UpdateTaskParams params) async {
    final data = await taskRepository.update(id: params.id, title: params.title, description: params.description, status: params.status, createdAt: params.createdAt, updatedAt: params.updatedAt!);

    return data.fold(
      (failure) => Left(failure),
      (taskEntities) => Right(taskEntities.map((taskEntity) => _mapTaskEntityToUpdateTaskParams(taskEntity)).toList()),
    );
  }
}

UpdateTaskParams _mapTaskEntityToUpdateTaskParams(TaskEntity taskEntity) {
  return UpdateTaskParams(
    id: taskEntity.id,
    title: taskEntity.title,
    description: taskEntity.description,
    status: taskEntity.status,
    createdAt: taskEntity.createdAt,
    updatedAt: taskEntity.updatedAt,
  );
}

class UpdateTaskParams extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const UpdateTaskParams({required this.id, required this.title, required this.description, this.status = false, required this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, title, description, status, createdAt, updatedAt];
}