import 'package:djamo_test/core/utils/lottites_animation_utils.dart';
import 'package:djamo_test/features/task/presentation/bloc/task_bloc.dart';
import 'package:djamo_test/features/task/presentation/pages/read/read_task_view.dart';
import 'package:djamo_test/features/task/presentation/provider/task_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/animate_page_route_utils.dart';
import '../../../../core/utils/app_colors_utils.dart';
import '../widget/task_card_widget.dart';
import 'add/add_task_view.dart';
import 'loaded/loaded_task_view.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {

  String _timeString = "";
  bool? value = false;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider = context.watch<TaskProvider>();
    final TaskBloc taskBloc = BlocProvider.of<TaskBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if(state is GetTaskLoaded) {
          taskProvider.updateTasks(state.taskEntity);
          print("LOADED TASK $state");
        }
      },
      builder: (context, state) {
        if(state is GetTaskLoading) {
        return const  Scaffold(
        body: Center(
        child: CircularProgressIndicator(),
        ),
        );
        } else if (state is GetTaskError){
         return Scaffold(body: Center(child: Text("ERROR"),),);
        }

        else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColorsUtils.kSecondarySoftLightColor,
              toolbarHeight: size.height / 13,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width / 3.5,
                    height: size.height / 17,
                    margin: EdgeInsets.only(left: size.width / 50),
                    decoration: BoxDecoration(
                        color: AppColorsUtils.kPrimaryColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: size.height / 21,
                            height: size.height / 21,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppColorsUtils.kWhiteColor,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: LottieDataWidgetUtils(
                                widthLottie: 30,
                                lottieAsset: "images/lotties/home_clock.json"
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(right: size.width / 20),
                          child: Text(
                            _timeString,
                            style: const TextStyle(
                              fontSize: 17,
                              color: AppColorsUtils.kWhiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: size.width / 9.5,
                    height: size.height / 20,
                    margin: EdgeInsets.only(right: size.width / 20),
                    decoration: BoxDecoration(
                      color: AppColorsUtils.kSoftGreyColor.withOpacity(.3),
                      border: Border.all(color: AppColorsUtils.kMediumGreyColor, ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.notifications),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: AppColorsUtils.kSecondarySoftLightColor,
            body: SafeArea(
              child: Column(
                children: [
                  // Welcome text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width / 30, top: size.height / 20),
                        child: RichText(
                          text: TextSpan(
                              text: "Bonjour,",
                              style: TextStyle(color: Colors.black, fontSize: 18),
                              children: [
                                TextSpan(text: "\nBienvenue sur",
                                  style: TextStyle(
                                      color: AppColorsUtils.kStrongGreyColor, fontSize: 18
                                  ),
                                ),
                                TextSpan(text: " OptimTask",
                                  style: TextStyle(
                                      color: AppColorsUtils.kPrimaryColor, fontSize: 18
                                  ),
                                ),
                              ]
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: size.height / 25),
                  Row(
                    children: [
                      Container(
                        width: size.width / 1.08,
                        height: size.height / 11,
                        margin: EdgeInsets.only(left: size.width / 30, right: size.width / 30),
                        decoration: BoxDecoration(
                            color: AppColorsUtils.kPrimaryColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: size.width / 30, right: size.width / 30),
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: size.height / 50, right: size.width / 25, bottom: 3),
                                      child: Text(
                                        "Tâches termminées",
                                        style: TextStyle(
                                            color: AppColorsUtils.kWhiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      )
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.check_circle, color: AppColorsUtils.kSuccessColor,),
                                      SizedBox(width: 7),
                                      Text(taskProvider.taskDone.toString(), style: TextStyle(color: AppColorsUtils.kSuccessColor),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: VerticalDivider(
                                width: 1,
                                thickness: .3,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: size.width / 30, right: size.width / 30),
                              child: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: size.height / 50, right: size.width / 25, bottom: 3),
                                      child: Text(
                                        "Tâches restantes",
                                        style: TextStyle(
                                            color: AppColorsUtils.kWhiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      )
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.timelapse, color: AppColorsUtils.kWarningColor),
                                      SizedBox(width: 7),
                                      Text(taskProvider.taskRemaining.toString(), style: TextStyle(color: AppColorsUtils.kWarningColor, fontWeight: FontWeight.w400),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width / 30, right: size.width / 30, top: size.height / 25, bottom: 7.5),
                        child: Text(
                            "Liste des Tâches",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
                        ),
                      ),
                    ],
                  ),
                  //list task
                  taskProvider.taskEntities.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(bottom: 70),
                        physics: const BouncingScrollPhysics(),
                        itemCount: taskProvider.taskEntities.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {

                            },
                            child: TaskCardWidget(
                              containerWidth: size.width / 1.08,
                              containerHeight: size.height / 13.5,
                              marginLeft: size.width / 30,
                              marginRight: size.width / 30,
                              marginTop: 0,
                              marginBottom: size.height / 80,
                              radius: 10,
                              border: taskProvider.taskEntities[index].status!
                              ? const Border(
                                left: BorderSide(color:   AppColorsUtils.kSuccessColor, width: 5),
                                right: BorderSide(color: AppColorsUtils.kSuccessColor, width: .1),
                                top: BorderSide(color: AppColorsUtils.kSuccessColor, width: .1),
                                bottom: BorderSide(color: AppColorsUtils.kSuccessColor, width: .1),
                              )
                              : const Border(
                                left: BorderSide(color:   AppColorsUtils.kPrimaryColor, width: 5),
                                right: BorderSide(color: AppColorsUtils.kPrimaryColor, width: .1),
                                top: BorderSide(color: AppColorsUtils.kPrimaryColor, width: .1),
                                bottom: BorderSide(color: AppColorsUtils.kPrimaryColor, width: .1),
                              ),
                              boxShadowSpreadRadius: 0,
                              boxShadowBlurRadius: 10,
                              offsetLeft: 0,
                              offsetRight: 0,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, SlideRightRoute(page: ReadTaskView(taskBloc: taskBloc, taskProvider: taskProvider,)));
                                    },
                                    onDoubleTap:(){
                                      taskProvider.makeDoneTask(taskProvider.taskEntities[index].id);
                                      taskBloc.add(SaveTaskEvent(tasks: taskProvider.taskEntities));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(left: size.width / 25, top: size.height / 75),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(child: Text(
                                                  taskProvider.taskEntities[index].title,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                                                ),),
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(left: size.width / 90),
                                                      child: Icon(Icons.access_time_filled_sharp, color: taskProvider.taskEntities[index].status! ? AppColorsUtils.kSuccessColor : AppColorsUtils.kPrimaryColor, size: 18,),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(_formatDateTime(taskProvider.taskEntities[index].createdAt))
                                                  ],
                                                )
                                              ],
                                            )
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: size.width / 50, right: size.width / 50, top: size.height / 55),
                                          child:Checkbox(
                                            value: taskProvider.taskSelected.contains(taskProvider.taskEntities[index]),
                                            onChanged: (bool? newValue) {
                                              print(newValue);
                                              if(taskProvider.taskSelected.contains(taskProvider.taskEntities[index])){
                                                taskProvider.removeSelected(taskProvider.taskEntities[index].id);
                                              }else{
                                                taskProvider.addSelected(taskProvider.taskEntities[index].id);

                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                  )
                  : const  Text("VIDE")
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              backgroundColor: taskProvider.taskSelected.isEmpty ? AppColorsUtils.kPrimaryColor:AppColorsUtils.kDangerColor,
              tooltip: "Ajouter une nouvelle tâche",
              onPressed: taskProvider.taskSelected.isEmpty
                  ? () => Navigator.push(context, SlideRightRoute(page: AddTaskView(taskBloc: taskBloc, taskProvider: taskProvider,)))
                  : (){
                    taskProvider.deletedTask();
                    taskBloc.add(SaveTaskEvent(tasks: taskProvider.taskEntities));
                  },
              child: Icon(taskProvider.taskSelected.isEmpty ? Icons.add : Icons.delete_forever, size: 28, color:taskProvider.taskSelected.isEmpty ? AppColorsUtils.kWhiteColor: AppColorsUtils.kWhiteColor),
            ),
            extendBody: true,
          );
        }
      },
    );
  }

  String _formatDateTime(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }
}
