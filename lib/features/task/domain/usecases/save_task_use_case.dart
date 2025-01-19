import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/domain/repositories/task_repository.dart';
import 'package:equatable/equatable.dart';

import '../entities/task_entity.dart';

class SaveTaskUseCase implements UseCase<void, List<TaskEntity>> {
  final TaskRepository taskRepository;

  const SaveTaskUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, dynamic>> call(List<TaskEntity> params) async{
    return await taskRepository.save( params );
  }
}

class SaveTaskParams extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const SaveTaskParams({required this.id, required this.title, required this.description, this.status = false, required this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, title, description, status, createdAt, updatedAt];
}