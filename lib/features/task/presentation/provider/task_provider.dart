import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/task_model.dart';
import '../../domain/entities/task_entity.dart';

class TaskProvider extends ChangeNotifier{
  List<TaskEntity> _taskEntities = [];
  List<TaskEntity> _taskSelected = [];

  int _taskDone = 0;
  int _taskRemaining = 0;
  var uuid = const Uuid();

  List<TaskEntity> get taskEntities => _taskEntities;
  List<TaskEntity> get taskSelected => _taskSelected;
  int get taskDone => _taskDone;
  int get taskRemaining => _taskRemaining;

  Stream<DateTime> dateStream = Stream.periodic(Duration(seconds: 1), (_) => DateTime.now());

  updateTasks(List<TaskEntity> taskEntity) {
    _taskEntities = taskEntity;
    filter();
    // notifyListeners();
  }

  makeDoneTask(id) {
    _taskEntities.firstWhere((element) => element.id ==id).status = true;
    filter();
  }

  deletedTask() {
    _taskEntities.removeWhere((taskEntity) => _taskSelected.any((selectedTask) => selectedTask.id == taskEntity.id));
    _taskSelected.clear();

    filter();
  }

  addSelected(id) {
    _taskSelected.add(_taskEntities.firstWhere((element) => element.id ==id));
    notifyListeners();
  }

  removeSelected(id) {
    _taskSelected.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  filter(){
    _taskDone = _taskEntities.where((task) => task.status == true).length;
    _taskRemaining = _taskEntities.where((task) => task.status == false).length;
    notifyListeners();
  }
  
  add(String title, String description){
    // TaskEntity task = TaskEntity(id: uuid.v1(), title: title, description: description, status: false, createdAt: DateTime.now());

    TaskModel task = TaskModel(
      id: uuid.v1(),
      title: title,
      description: description,
      status: false,
      createdAt: DateTime.now(),
    );

    _taskEntities.add(task);
    filter();
  }

  update(String id, String title, String description) {
    for (var task in taskEntities) {
      if (task.id == id) {
        task.title = title;
        task.description = description;
        task.updatedAt = DateTime.now();
      }
    }
    filter();
  }
}