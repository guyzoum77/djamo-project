part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();
}

final class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class FetchAllTaskLoading extends TaskState {
  @override
  List<Object?> get props => throw UnimplementedError();
}


class FetchAllTaskLoaded extends TaskState {
  final List<TaskEntity> taskEntity;
  const FetchAllTaskLoaded({required this.taskEntity});


  @override
  List<Object?> get props => [taskEntity];
}


class FetchAllTaskError extends TaskState {
  final String message;
  const FetchAllTaskError({required this.message});

  @override
  List<Object?> get props => [message];
}