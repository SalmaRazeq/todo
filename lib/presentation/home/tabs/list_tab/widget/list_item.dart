import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/date_utils.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.bgColor,
      padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 15),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              flex: 2,
              onPressed: (context) {},
              backgroundColor: const Color(0xFFEC4B4B),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              autoClose: true,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
            ),
            SlidableAction(
              flex: 2,
              onPressed: (context) {},
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
                      'Task title',
                      style: ApplightStyle.taskTitle,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Task description',
                      style: ApplightStyle.taskDescription,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(DateTime.now().toFormattedDate),
                  ],
                ),
              ),
              const Spacer(),
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
            ],
          ),
        ),
      ),
    );
  }
}
