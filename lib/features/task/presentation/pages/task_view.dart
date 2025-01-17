import 'package:djamo_test/core/utils/lottites_animation_utils.dart';
import 'package:djamo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:djamo_test/features/task/presentation/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider = context.watch<TaskProvider>();

    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if(state is FetchAllTaskLoaded) {
          taskProvider.update(state.taskEntity);
        }
      },
      builder: (context, state) {
        switch(state) {
          case FetchAllTaskLoading():
            return const Scaffold(body: CircularProgressIndicator());
            break;
          case FetchAllTaskLoaded():
            return const Scaffold(body: Text("Chargement ok"));
            break;
          case FetchAllTaskError():
            return const Scaffold(body: LottieWidgetUtils(widthLottie: 200, lottieAsset: "lottieAsset", textContent: "textContent"));
            break;
          case TaskInitial():
            return const Scaffold(body: CircularProgressIndicator());
        }
      },
    );
  }
}
