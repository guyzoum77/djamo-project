import 'package:djamo_test/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:djamo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:djamo_test/features/task/presentation/pages/task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/task/presentation/pages/loaded/loaded_task_view.dart';
import 'features/task/presentation/pages/task_view.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return  MaterialApp(home: OnBoardingPage());
    //return  MaterialApp(home: TaskView());
    return  MaterialApp(home: LoadedTaskView());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("data")
      ),
      
    );
  }
}
