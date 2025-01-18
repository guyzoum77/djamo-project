import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/data/data_sources/local/task_local_data_source.dart';
import 'package:djamo_test/features/task/data/models/task_model.dart';
import 'package:djamo_test/features/task/domain/entities/task_entity.dart';
import 'package:djamo_test/features/task/domain/repositories/task_repository.dart';

class FetchAllTaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource taskLocalDataSource;


  FetchAllTaskRepositoryImpl({required this.taskLocalDataSource});

  @override
  Future<Either<Failure, List<TaskEntity>>> fetchAll() async {
    try {
      final List<TaskModel> tasks = await taskLocalDataSource.fetch();

      return Right(tasks);

    } catch(e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> save({required String id, required String title, required String description, required bool status, required DateTime createdAt}) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> update({required String id, required String title, required String description, required bool status, required DateTime createdAt, required DateTime updatedAt}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}