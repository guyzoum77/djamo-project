import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:djamo_test/core/domain/usecases/usecase.dart';
import 'package:djamo_test/core/error/failures.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/usecases/get_task_use_case.dart';
import '../../domain/usecases/save_task_use_case.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTaskUseCase getTaskUseCase;
  final SaveTaskUseCase saveTaskUseCase;

  TaskBloc({required this.getTaskUseCase, required this.saveTaskUseCase}) : super(TaskInitial()) {
    on<TaskEvent>((event, emit) async{
      if (event is GetTaskEvent) {
        emit(GetTaskLoading());
        final Either<Failure, List<TaskEntity>> failureOrSuccess = await getTaskUseCase(NoParams());
        emit(failureOrSuccess.fold(
          (l) => const GetTaskError(message: 'Cache failure'),
          (r) => GetTaskLoaded(taskEntity: r))
        );
      } else if (event is SaveTaskEvent){
        emit(SaveTaskLoading());
        final Either<Failure, void> failureOrSuccess = await saveTaskUseCase(event.tasks);
        emit(failureOrSuccess.fold(
                (l) => const SaveTaskError(message: 'Cache failure'),
                (r) => SaveTaskLoaded()));
      }
    });
  }
}
