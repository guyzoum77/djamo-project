import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/domain/entities/task_entity.dart';
import 'package:djamo_test/features/task/domain/usecases/save_task_use_case.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> get();

  Future<Either<Failure, void>> save(  List<TaskEntity> tasks);
}