import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:djamo_test/core/utils/button_custom_utils.dart';
import 'package:djamo_test/core/utils/lottites_animation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../../../../../core/utils/app_colors_utils.dart';
import '../../../../../core/utils/text_field_utils.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final _formKeyAddNewTask = GlobalKey<FormState>();

  late TextEditingController _titleCtrl = TextEditingController();
  late TextEditingController _descriptionCtrl = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlurryModalProgressHUD(
      inAsyncCall: isLoading,
      blurEffectIntensity: 4,
      progressIndicator: const SpinKitFadingCircle(
        color: AppColorsUtils.kPrimaryColor,
        size: 90.0,
      ),
      dismissible: false,
      opacity: 0.4,
      color: AppColorsUtils.kBlackColor,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColorsUtils.kSecondarySoftLightColor,
          automaticallyImplyLeading: false,
          title: Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text("Retour", style: TextStyle(color: AppColorsUtils.kBlackColor, fontWeight: FontWeight.bold, fontSize: 19)),
          ),
          elevation: 0.3,
          leading: Container(
              width: 20,
              height: 20,
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.chevron_left, color: AppColorsUtils.kPrimaryColor,),
              )
          ),
        ),
        backgroundColor: AppColorsUtils.kSecondarySoftLightColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const LottieDataWidgetUtils(widthLottie: 350, lottieAsset: "images/lotties/add_new_task.json"),
                Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Form(
                      key: _formKeyAddNewTask,
                      child: Column(
                        children: [
                          SizedBox(height: size.height / 10),
                          //title input
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: CustomTextField(
                                hintText: 'Titre',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Description of date is required';
                                  }
                                  return null;
                                },
                                controller: _titleCtrl,
                                onFieldSubmitted: (String titleNewValue) {
                                  setState(() {
                                    _titleCtrl = TextEditingController(text: titleNewValue);
                                  });
                                }
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Row(
                                  children: [
                                    Icon(Icons.info, color: AppColorsUtils.kMediumGreyColor, size: 15),
                                    SizedBox(width: 3),
                                    Text("Entrer le titre de la tâche",
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.bold,
                                        color: AppColorsUtils.kMediumGreyColor,
                                        fontSize: 13
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          // description
                          const SizedBox(height: 30),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: CustomTextField(
                                hintText: 'Description',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'La description de la tâche est requise';
                                  }
                                  return null;
                                },
                                controller: _descriptionCtrl,
                                onFieldSubmitted: (String descriptionNewValue) {
                                  setState(() {
                                    _descriptionCtrl = TextEditingController(text: descriptionNewValue);
                                  });
                                }
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: const[
                                    Icon(Icons.info, color: AppColorsUtils.kMediumGreyColor, size: 15),
                                    SizedBox(width: 3),
                                    Text("Entrer la description de la tâche",
                                      style: TextStyle(
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.bold,
                                          color: AppColorsUtils.kMediumGreyColor,
                                          fontSize: 13
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  )
                )
              ],
            )
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: CustomOutlineButton(
            name: "Enregistrer",
            onPressed: () {},
            minimumSize: 41,
            borderRadius: 6,
            backgroundColor: AppColorsUtils.kPrimaryColor,
            borderSideColor: AppColorsUtils.kPrimaryColor,
            primaryColor: AppColorsUtils.kPrimaryColor,
            textColor: AppColorsUtils.kWhiteColor,
            elevation: .6,
            fontSize: 17,
          )
        )
      )
    );
  }
}
