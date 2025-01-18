import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> fetchAll();

  Future<Either<Failure, void>>save({required String id, required String title, required String description, required bool status, required DateTime createdAt});

  Future<Either<Failure, List<TaskEntity>>>update({required String id, required String title, required String description, required bool status, required DateTime createdAt, required DateTime updatedAt});

  Future<Either<Failure, void>>delete(String id);
}