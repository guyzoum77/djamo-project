import 'package:flutter/material.dart';

import '../../domain/entities/task_entity.dart';

class TaskProvider extends ChangeNotifier{
  List<TaskEntity> _taskEntities = [];
  List<TaskEntity> get taskEntities => _taskEntities;

  update(List<TaskEntity> taskEntity) {
    _taskEntities = taskEntity;
    notifyListeners();
  }


}