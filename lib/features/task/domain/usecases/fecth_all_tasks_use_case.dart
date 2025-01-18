import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/domain/entities/task_entity.dart';
import 'package:djamo_test/features/task/domain/repositories/task_repository.dart';

class FetchAllTaskUseCase implements UseCase<List<TaskEntity>, NoParams> {
  final TaskRepository taskRepository;

  FetchAllTaskUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, List<TaskEntity>>> call(NoParams params) async {
    return await taskRepository.fetchAll();
  }

}