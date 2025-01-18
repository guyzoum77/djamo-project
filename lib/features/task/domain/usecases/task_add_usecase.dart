import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/domain/repositories/task_repository.dart';
import 'package:equatable/equatable.dart';

class TaskAddUseCase implements UseCase<void, AddTaskParams> {
  final TaskRepository taskRepository;

  const TaskAddUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, dynamic>> call(AddTaskParams params) {
    return taskRepository.save(id: params.id, title: params.title, description: params.description, status: params.status, createdAt: params.createdAt);
  }
}

class AddTaskParams extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const AddTaskParams({required this.id, required this.title, required this.description, this.status = false, required this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, title, description, status, createdAt, updatedAt];
}