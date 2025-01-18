import 'package:djamo_test/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {

  const TaskModel({ required super.id, required super.title, required super.description, required super.status, required super.createdAt, super.updatedAt });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(id: json["id"], title: json["title"], description: json["description"], status: json["status"], createdAt: json["createdAt"], updatedAt: json["updatedAt"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "status": status,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}