import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/usecases/fecth_all_tasks_use_case.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FetchAllTaskUseCase fetchAllTaskUseCase;

  TaskBloc({required this.fetchAllTaskUseCase}) : super(TaskInitial()) {
    on<TaskEvent>((event, emit) async{
      if (event is FetchAllTaskEvent) {
        emit(FetchAllTaskLoading());
        final Either<Failure, List<TaskEntity>> failureOrSuccess = await fetchAllTaskUseCase(NoParams());
        emit(failureOrSuccess.fold(
          (l) => const FetchAllTaskError(message: 'Cache failure'),
          (r) => FetchAllTaskLoaded(taskEntity: r))
        );
      }
    });
  }
}
