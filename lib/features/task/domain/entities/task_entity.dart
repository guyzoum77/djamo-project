import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
   String id;
   String title;
   String description;
   bool? status;
   DateTime createdAt;
   DateTime? updatedAt;


   TaskEntity({required this.id, required this.title, required this.description, required this.status, required this.createdAt, this.updatedAt});

  @override
  List<Object?> get props => [id, title, description, status, createdAt, updatedAt];
}