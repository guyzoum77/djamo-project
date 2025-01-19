import 'package:djamo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:djamo_test/features/task/presentation/pages/task_view.dart';
import 'package:djamo_test/features/task/presentation/provider/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../injection_container.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<TaskBloc>()..add(GetTaskEvent()),
        child: ChangeNotifierProvider(create: (_) => TaskProvider(), child: TaskView())
    );
  }
}
