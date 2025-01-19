import 'dart:convert';

import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/data/models/task_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> get();

  Future<void> save(List<TaskModel> tasks);
}


class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  static const CACHED_TASK = "CACHED_TASK";
  final FlutterSecureStorage storage;


  TaskLocalDataSourceImpl({required this.storage});

  @override
  Future<List<TaskModel>> get() async {
    try {
      final String? value = await storage.read(key: CACHED_TASK);

      if (value == null) {
        return [];
      }

      List<dynamic> taskList = jsonDecode(value);
      List<TaskModel> allTasks = taskList.map((e) => TaskModel.fromJson(e)).toList();

      return allTasks;
    } catch (e) {
      throw CacheFailure();
    }
  }


  @override
  Future<void> save(List<TaskModel> tasks)async {
    try{
      String jsonString = json.encode(tasks.map((task) => task.toJson()).toList());

      await storage.write(key: CACHED_TASK, value: jsonString);
    } catch(e){
      throw CacheFailure();
    }
  }
}