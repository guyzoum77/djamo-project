import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> fetchAll();
}