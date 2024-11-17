import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/date_utils.dart';
import 'package:todolist_app/database_manager/model/todo_dm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();

  static Future show(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: const TaskBottomSheet(),
          );
        });
  }
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .55.h,
      padding: REdgeInsets.all(22),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.bottomSheetHeader,
              style: AppLightStyle.headerTaskBottom,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return AppLocalizations.of(context)!.validateTaskTitle;
                }
                return null;
              },
              controller: titleController,style: AppLightStyle.controllerTextStyle,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.taskTitleHint,
                hintStyle: AppLightStyle.hintTextStyle,
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            TextFormField(
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return AppLocalizations.of(context)!.validateTaskDesc;
                }
                return null;
              },
              controller: descriptionController,style: AppLightStyle.controllerTextStyle,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.taskDescHint,
                hintStyle: AppLightStyle.hintTextStyle,

              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              AppLocalizations.of(context)!.selectDate,
              style: AppLightStyle.taskBottomTextStyle,
            ),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
                onTap: () {
                  showTaskDatePicker();
                },
                child: Text(
                  selectedDate.toFormattedDate,
                  style: AppLightStyle.dateStyle,
                  textAlign: TextAlign.center,
                )),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  //add the task
                  addTaskToFireStore();
                },
                child: Text(
                  AppLocalizations.of(context)!.addTaskButton, style: AppLightStyle.buttonTextStyle,
                ))
          ],
        ),
      ),
    );
  }

  void showTaskDatePicker() async {
    selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        ) ??
        selectedDate;

    setState(() {});
  }

  void addTaskToFireStore() {
    if(formKey.currentState!.validate() == false) return;

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);

    DocumentReference documentReference = collectionReference.doc();
    TodoDM todo = TodoDM(
        id: documentReference.id,
        taskTitle: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate.copyWith(
            second: 0, microsecond: 0, millisecond: 0, minute: 0, hour: 0),
        isDone: false);

    documentReference.set(todo.toFireStore()).then((_) {
      print('Success');
      Navigator.pop(context);
    }).onError((error, stackTrace) {
      print('Error occurred');
    }).timeout(const Duration(seconds: 3), onTimeout: () {
      print('Enter TimeOut');
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }
}
