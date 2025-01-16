part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();
}

class FetchAllTaskEvent extends TaskEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
