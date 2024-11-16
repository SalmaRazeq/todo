import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/date_utils.dart';
import 'package:todolist_app/core/utils/route_manager.dart';
import 'package:todolist_app/database_manager/model/todo_dm.dart';

class ListItem extends StatelessWidget {
   ListItem({super.key, required this.todo, required this.onDeletedTask});
  TodoDM todo;
  VoidCallback onDeletedTask;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 27, right: 27, top: 25),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.onPrimary),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                flex: 2,
                onPressed: (context) {
                  onDeletedTask();
                },
                backgroundColor: const Color(0xFFEC4B4B),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                autoClose: true,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
              ),
              SlidableAction(
                flex: 2,
                onPressed: (context) {
                  Navigator.pushReplacementNamed(context, RoutesManager.updateRoute);
                },
                backgroundColor: ColorsManager.blue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
                autoClose: true,
              ),
            ],
          ),

          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            width: double.infinity,
            height: 115,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 62,
                    width: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        todo.taskTitle,
                        style: AppLightStyle.taskTitle,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        todo.description,
                        style: AppLightStyle.taskDescription,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(DateTime.now().toFormattedDate),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  ///onTap: firebaseFunction.updateIsDone(todo)

                  child: todo.isDone ? Text('isDone!', style: TextStyle(color: Color(0xFF61E757)),):
                  Container(
                    width: 70,
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: ColorsManager.white,
                      size: 30,
                      weight: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
