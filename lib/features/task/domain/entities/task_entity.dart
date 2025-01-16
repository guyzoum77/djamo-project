import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;


  const TaskEntity({required this.title, required this.description, required this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [title, description, createdAt, updatedAt];

}