import 'dart:async';

import 'package:djamo_test/core/utils/animate_page_route_utils.dart';
import 'package:djamo_test/core/utils/app_colors_utils.dart';
import 'package:djamo_test/core/utils/lottites_animation_utils.dart';
import 'package:djamo_test/features/task/presentation/pages/add/add_task_view.dart';
import 'package:djamo_test/features/task/presentation/widget/task_card_widget.dart';
import 'package:djamo_test/features/task/presentation/widget/task_progressbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class LoadedTaskView extends StatefulWidget {
  const LoadedTaskView({super.key});

  @override
  State<LoadedTaskView> createState() => _LoadedTaskViewState();
}

class _LoadedTaskViewState extends State<LoadedTaskView> {
  String _timeString = "";

  @override
  void initState() {
    _timeString = _formatDateTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
      body: SingleChildScrollView(
        child: SafeArea(
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
                                  "Tâche termminée",
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
                                  Text("14 / 20", style: TextStyle(color: AppColorsUtils.kSuccessColor),)
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
                                    "Tâche en cours",
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
                                  Text("6 / 20", style: TextStyle(color: AppColorsUtils.kWarningColor, fontWeight: FontWeight.w400),)
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

              // today task
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: size.width / 30, right: size.width / 30, top: size.height / 20, bottom: size.height / 90),
                        child: Text(
                          "Tâches terminées",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: AppColorsUtils.kSecondarySoftLightColor,
                      width: size.width,
                      height: size.height / 3.8,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 1),
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return TaskCardWidget(
                            containerWidth: size.width / 1.35,
                            containerHeight: size.height / 3.5,
                            marginLeft: size.width / 30,
                            marginRight: size.width / 30,
                            marginTop: 0,
                            marginBottom: 0,
                            radius: 10,
                            boxShadowSpreadRadius: 0,
                            boxShadowBlurRadius: 1,
                            offsetLeft: 0,
                            offsetRight: 1,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: size.width / 7.5,
                                      height: size.width / 7.5,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: AppColorsUtils.kSecondaryMediumLightColor
                                      ),
                                      child: Center(
                                          child: Icon(Icons.task, size: size.height / 30, color: AppColorsUtils.kPrimaryColor,)
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: size.width / 2,
                                        margin: EdgeInsets.only(left: size.width / 40, top: size.height / 90),
                                        child: Text(
                                          "Titre de la tâche",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 25
                                          ),
                                          maxLines: 2,
                                        )
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: size.width / 40),
                                      child: Text("12 Février 2025"),
                                    ),
                                  ],
                                ),

                                //progress bar of task
                                Container(
                                    margin: EdgeInsets.only(left: size.width / 40, right: size.width / 40, top: size.height / 20),
                                    child: TaskProgressBarWidget(
                                        taskPercent: "",
                                        progressIndicatorValue: 1,
                                        progressBarColor: AppColorsUtils.kPrimaryColor,
                                        progressBackgroundColor: AppColorsUtils.kPrimaryColor.withAlpha(50),
                                        textColor: AppColorsUtils.kWhiteColor,
                                        fontSize: 16,
                                        progressBarHeight: 12,
                                        progressBarWidth: size.width / 1.47
                                    )
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: size.width / 25, top: size.height / 90),
                                      child: Text("Terminé"),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      )
                  )
                ],
              ),

              //list task
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      Container(
                        margin: EdgeInsets.only(left: size.width / 30, right: size.width / 23, top: size.height / 25, bottom: 7.5),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Voir tout",
                            style: TextStyle(color: AppColorsUtils.kGreyColor, fontWeight: FontWeight.w500)
                          )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 3.2,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return TaskCardWidget(
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
                                        margin: EdgeInsets.only(left: size.width / 50, top: size.height / 55),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: const Icon(Ionicons.ellipsis_vertical, color: AppColorsUtils.kPrimaryColor,),
                                        )
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(left: size.width / 50),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColorsUtils.kPrimaryColor,
          tooltip: "Ajouter une nouvelle tâche",
          onPressed: () => Navigator.push(context, SlideRightRoute(page: AddTaskView())),
          child: const Icon(Icons.add, size: 28, color: AppColorsUtils.kWhiteColor),
        )
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: size.width / 90, right: size.width / 90, bottom: size.height / 90),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(.1),
              spreadRadius: 0 ,
              blurRadius: 40,
              offset: const Offset(0, 1),
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: BottomAppBar(
            color: AppColorsUtils.kWhiteColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 12,
            height: size.height / 15,
          ),
        ),
      ),
      extendBody: true,
    );
  }

  String _formatDateTime() {
    return DateFormat('HH:mm').format(DateTime.now());
  }
}