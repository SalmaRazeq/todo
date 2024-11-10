import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/date_utils.dart';

class TaskBotoomSheet extends StatefulWidget {
  const TaskBotoomSheet({super.key});
  @override
  State<TaskBotoomSheet> createState() => _TaskBotoomSheetState();

  static Widget show() => const TaskBotoomSheet();
}

class _TaskBotoomSheetState extends State<TaskBotoomSheet> {
DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Add New Task',
            style: ApplightStyle.headerTaskBottom,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your task',
              hintStyle: ApplightStyle.hintTextStyle,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your task description',
              hintStyle: ApplightStyle.hintTextStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Select date',
            style: ApplightStyle.taskBottomTextStyle,
          ),
          const SizedBox(height: 8,),
          InkWell(
              onTap: () {
                showTaskDatePicker(context);
              },
              child: Text(
                selectedDate.toFormattedDate,
                style: ApplightStyle.dateStyle,
                textAlign: TextAlign.center,
              )),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text('Add task',))
        ],
      ),
    );
  }

  void showTaskDatePicker(BuildContext context) async{
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    ) ?? selectedDate;

    setState(() {

    });
  }
}
