import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:djamo_test/features/task/domain/entities/task_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../core/utils/app_colors_utils.dart';
import '../../../../../core/utils/button_custom_utils.dart';
import '../../../../../core/utils/text_field_utils.dart';
import '../../bloc/task_bloc.dart';
import '../../provider/task_provider.dart';

class ReadTaskView extends StatefulWidget {
  final TaskBloc taskBloc;
  final TaskProvider taskProvider;
  TaskEntity taskEntity;

  ReadTaskView({super.key, required this.taskBloc, required this.taskProvider, required this.taskEntity});

  @override
  State<ReadTaskView> createState() => _ReadTaskViewState();
}

class _ReadTaskViewState extends State<ReadTaskView> {
  final _formKeyAddNewTask = GlobalKey<FormState>();

  late TextEditingController _titleCtrl = TextEditingController(text: widget.taskEntity.title);
  late TextEditingController _descriptionCtrl = TextEditingController(text: widget.taskEntity.description);

  bool isLoading = false;
  bool enableTextField = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer(
      bloc: widget.taskBloc,
        listener: (context,state){
      },
      builder: (context,state){
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
                child: const Text("Détail de tâche", style: TextStyle(color: AppColorsUtils.kBlackColor, fontWeight: FontWeight.bold, fontSize: 19)),
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
                        Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: Form(
                                key: _formKeyAddNewTask,
                                child: Column(
                                  children: [
                                    SizedBox(height: size.height / 10),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10, right: 10),
                                      child: CustomTextField(
                                        enabled: enableTextField,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Description of date is required';
                                          }
                                          return null;
                                        },
                                        controller: _titleCtrl,
                                        onFieldSubmitted: (String titleNewValue) {}
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
                                    const SizedBox(height: 30),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10, right: 10),
                                      child: CustomTextField(
                                        enabled: enableTextField,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'La description de la tâche est requise';
                                          }
                                          return null;
                                        },
                                        controller: _descriptionCtrl,
                                        onFieldSubmitted: (String descriptionNewValue) {}
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
            floatingActionButton: enableTextField
            ? null
            : FloatingActionButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              backgroundColor: AppColorsUtils.kPrimaryColor,
              tooltip: "Modifier la tâche",
              onPressed: () {
                setState(() {
                  enableTextField = true;
                });
              },
              child: Icon(Icons.edit, color: AppColorsUtils.kWhiteColor,),
            ),
            bottomNavigationBar: enableTextField ? Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: MediaQuery.of(context).viewInsets.bottom),
              child: CustomOutlineButton(
                name: "Enregistrer",
                onPressed: () {
                  widget.taskProvider.update(widget.taskEntity.id, _titleCtrl.text, _descriptionCtrl.text);
                  widget.taskBloc.add(SaveTaskEvent(tasks: widget.taskProvider.taskEntities));
                  Navigator.pop(context);
                },
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
            : null
          )
        );
      }
    );
  }
}