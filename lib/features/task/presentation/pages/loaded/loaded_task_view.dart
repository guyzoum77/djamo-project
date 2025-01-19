import 'dart:async';

import 'package:djamo_test/core/utils/animate_page_route_utils.dart';
import 'package:djamo_test/core/utils/app_colors_utils.dart';
import 'package:djamo_test/core/utils/lottites_animation_utils.dart';
import 'package:djamo_test/features/task/presentation/pages/add/add_task_view.dart';
import 'package:djamo_test/features/task/presentation/widget/task_card_widget.dart';
import 'package:djamo_test/features/task/presentation/widget/task_progressbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

import '../../bloc/task_bloc.dart';
import '../../provider/task_provider.dart';

class LoadedTaskView extends StatefulWidget {
  final TaskProvider taskProvider;
  final TaskBloc taskBloc;

  const LoadedTaskView({super.key, required this.taskProvider, required this.taskBloc});

  @override
  State<LoadedTaskView> createState() => _LoadedTaskViewState();
}

class _LoadedTaskViewState extends State<LoadedTaskView> {


  String _timeString = "";
  bool? value = false;

  @override
  void initState() {
    _timeString = _formatDateTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<TaskBloc, TaskState>(
      bloc: widget.taskBloc,
      builder: (context, state){
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
                // resume

                state is GetTaskLoading ?  Column(
                  children: [
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
                                        Text("14", style: TextStyle(color: AppColorsUtils.kSuccessColor),)
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
                                        Text("6", style: TextStyle(color: AppColorsUtils.kWarningColor, fontWeight: FontWeight.w400),)
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
                    Expanded(
                      // height: size.height,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 70),
                          physics: BouncingScrollPhysics(),
                          itemCount: 13,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: (){},
                              child: TaskCardWidget(
                                containerWidth: size.width / 1.08,
                                containerHeight: size.height / 13.5,
                                marginLeft: size.width / 30,
                                marginRight: size.width / 30,
                                marginTop: 0,
                                marginBottom: size.height / 80,
                                radius: 10,
                                border: const Border(
                                  left: BorderSide(color: AppColorsUtils.kPrimaryColor, width: 5),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(left: size.width / 25, top: size.height / 75),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Titre de la tâche",
                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(left: size.width / 90),
                                                      child: Icon(Icons.access_time_filled_sharp, color: AppColorsUtils.kPrimaryColor, size: 18,),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text("08:59")
                                                  ],
                                                )
                                              ],
                                            )
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: size.width / 50, right: size.width / 50, top: size.height / 55),
                                          child:Checkbox(
                                            // tristate: true,
                                            value: value,
                                            onChanged: (bool? newValue) {
                                              setState(() {
                                                value = newValue;
                                              });
                                            },
                                          ),
                                        )

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    )
                  ],
                ) : const CircularProgressIndicator(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            backgroundColor: AppColorsUtils.kPrimaryColor,
            tooltip: "Ajouter une nouvelle tâche",
            onPressed: () {},
            child: const Icon(Icons.add, size: 28, color: AppColorsUtils.kWhiteColor),
          ),
          extendBody: true,
        );
      },
      listener: (context, state){
        print("LOADED TASK $state");
      },);
  }

  String _formatDateTime() {
    return DateFormat('HH:mm').format(DateTime.now());
  }
}