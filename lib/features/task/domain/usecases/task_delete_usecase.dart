import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../repositories/task_repository.dart';

class TaskDeleteUseCase extends UseCase<void, DeleteTaskById>{
  final TaskRepository taskRepository;

  TaskDeleteUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, dynamic>> call(DeleteTaskById params) {
    return taskRepository.delete(params.id);
  }
}

class DeleteTaskById extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const DeleteTaskById({required this.id, required this.title, required this.description, this.status = false, required this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, title, description, status, createdAt, updatedAt];
}