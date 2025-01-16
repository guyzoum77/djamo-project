import 'package:djamo_test/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {

  const TaskModel({ required super.title, required super.description, required super.createdAt, super.updatedAt });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(title: json["title"], description: json["description"], createdAt: json["createdAt"], updatedAt: json["updatedAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}