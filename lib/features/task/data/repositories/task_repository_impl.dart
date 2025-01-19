import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/data/data_sources/local/task_local_data_source.dart';
import 'package:djamo_test/features/task/data/models/task_model.dart';
import 'package:djamo_test/features/task/domain/entities/task_entity.dart';
import 'package:djamo_test/features/task/domain/repositories/task_repository.dart';
import 'package:djamo_test/features/task/domain/usecases/save_task_use_case.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource taskLocalDataSource;


  TaskRepositoryImpl({required this.taskLocalDataSource});

  @override
  Future<Either<Failure, List<TaskEntity>>> get() async {
    try {
      final List<TaskModel> tasks = await taskLocalDataSource.get();

      return Right(tasks);
    } catch(e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> save(List<TaskEntity> saveTaskParams) async{
    try {
      final List<TaskModel> tasks = saveTaskParams.map((e) => TaskModel(id: e.id, title: e.title, description: e.description, status: e.status, createdAt: e.createdAt, updatedAt: e.updatedAt)).toList();

      return Right(await taskLocalDataSource.save(tasks));
    } catch(e) {
      return Left(CacheFailure());
    }
  }
}