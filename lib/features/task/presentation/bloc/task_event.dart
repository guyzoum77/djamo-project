part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetTaskEvent extends TaskEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SaveTaskEvent extends TaskEvent {
  final List<TaskEntity> tasks;

 const SaveTaskEvent({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}