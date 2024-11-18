import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_app/core/firebase/firebase_function.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/date_utils.dart';
import 'package:todolist_app/core/utils/route_manager.dart';
import 'package:todolist_app/database_manager/model/todo_dm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todolist_app/database_manager/model/user_dm.dart';

class ListItem extends StatelessWidget {
   ListItem({super.key, required this.todo, required this.onDeletedTask, required this.todokey});
  TodoDM todo;
  VoidCallback onDeletedTask;
  var todokey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),
          color: Theme.of(context).colorScheme.onPrimary),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) {
                onDeletedTask();
                deleteTodo(todo);
              },
              backgroundColor: const Color(0xFFEC4B4B),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              autoClose: true,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
            ),
            SlidableAction(
              flex: 2,
              onPressed: (context) {
                Navigator.of(context).pushNamed(RoutesManager.update, arguments: todo);
              },
              backgroundColor: ColorsManager.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
              autoClose: true,
            ),
          ],
        ),

        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          width: double.infinity,
          height: 115.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: (){},
                child: Container(
                  height: 62.h,
                  width: 4.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: todo.isDone ? ColorsManager.green : ColorsManager.blue,
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
                      style: AppLightStyle.taskTitle!.copyWith(
                          color: todo.isDone ? ColorsManager.green : ColorsManager.blue),
                    ),
                     SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      todo.description,
                      style: AppLightStyle.taskDescription,
                    ),
                     SizedBox(
                      height: 4.h,
                    ),
                    //Text(DateTime.now().toFormattedDate),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  FirebaseFunction.updateIsDone(todo);
                  todokey.currentState?.getTodoFromFireStore();
                },
                child: todo.isDone ? Text(AppLocalizations.of(context)!.isDone, style: TextStyle(fontSize : 22.sp,fontWeight: FontWeight.w700 ,color: ColorsManager.green),):
                Container(
                  width: 70,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Icon(
                    Icons.check,
                    color: todo.isDone ? ColorsManager.green : ColorsManager.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   void deleteTodo(TodoDM todo) async {
     CollectionReference todoCollection = FirebaseFirestore.instance
         .collection(UserDM.collectionName)
         .doc(UserDM.currentUser!.id)
         .collection(TodoDM.collectionName);
     DocumentReference todoDoc = todoCollection.doc(todo.id);
     await todoDoc.delete();
   }
}

class DataUpdate{
  TodoDM todo;
  var todoKey;

  DataUpdate({required this.todo, required this.todoKey});
}

