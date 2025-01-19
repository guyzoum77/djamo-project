part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();
}

final class TaskInitial extends TaskState {
  @override
  List<Object> get props => [];
}

class GetTaskLoading extends TaskState {
  @override
  List<Object?> get props => throw UnimplementedError();
}


class GetTaskLoaded extends TaskState {
  final List<TaskEntity> taskEntity;

  const GetTaskLoaded({required this.taskEntity});

  @override
  List<Object?> get props => [taskEntity];
}


class GetTaskError extends TaskState {
  final String message;
  const GetTaskError({required this.message});

  @override
  List<Object?> get props => [message];
}

class SaveTaskLoading extends TaskState {
  @override
  List<Object?> get props => throw UnimplementedError();
}


class SaveTaskLoaded extends TaskState {
  @override
  List<Object?> get props => throw UnimplementedError();
}


class SaveTaskError extends TaskState {
  final String message;

  const SaveTaskError({required this.message});

  @override
  List<Object?> get props => [message];
}