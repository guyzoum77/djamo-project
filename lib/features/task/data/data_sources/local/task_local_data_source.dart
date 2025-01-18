import 'dart:convert';

import 'package:djamo_test/core/error/failures.dart';
import 'package:djamo_test/features/task/data/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> fetch();
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  static const CACHED_TASK = "CACHED_TASK";
  final SharedPreferences sharedPreference;


  TaskLocalDataSourceImpl({required this.sharedPreference});

  @override
  Future<List<TaskModel>>fetch() async {
    try {
      final String? value = await sharedPreference.getString(CACHED_TASK);
      if (value == null ) {
        return [];
      }

      List<dynamic> task = jsonDecode(value);
      List<TaskModel> allTasks = task.map((e) => TaskModel.fromJson(e)).toList();

      return allTasks;

    } catch(e) {
      throw CacheFailure();
    }
  }

}