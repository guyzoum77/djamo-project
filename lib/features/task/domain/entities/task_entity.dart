import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  bool? status;
  final DateTime createdAt;
  final DateTime? updatedAt;


   TaskEntity({required this.id, required this.title, required this.description, required this.status, required this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, title, description, status, createdAt, updatedAt];
}