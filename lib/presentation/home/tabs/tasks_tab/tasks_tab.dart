import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/date_utils.dart';
import 'package:todolist_app/database_manager/model/todo_dm.dart';
import 'package:todolist_app/database_manager/model/user_dm.dart';
import 'package:todolist_app/presentation/home/tabs/tasks_tab/widget/list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksTab extends StatefulWidget {
  TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  DateTime calenderSelectedDate = DateTime.now();
  List<TodoDM> todoList = [];

  @override
  void initState() {
    super.initState();
    getTodoFromFireStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.taskTab),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 115.h,
                color: Theme.of(context).colorScheme.primary,
              ),
              buildCalenderTimeLine(),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListItem(
                  todokey: widget.key,
                  todo: todoList[index],
                  onDeletedTask: () {
                    getTodoFromFireStore();
                  },
                );
              },
              itemCount: todoList.length,
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildCalenderTimeLine() => EasyDateTimeLine(
  //       initialDate: DateTime.now(),
  //       onDateChange: (selectedDate) {},
  //       headerProps: const EasyHeaderProps(
  //           monthPickerType: MonthPickerType.dropDown,
  //           dateFormatter: DateFormatter.fullDateDMY(),
  //           showHeader: false),
  //       dayProps: EasyDayProps(
  //         height: 100.h,
  //         width: 70.w,
  //         dayStructure: DayStructure.dayStrDayNum,
  //         activeDayStyle: DayStyle(
  //           dayNumStyle: AppLightStyle.activeDayStyle,
  //           dayStrStyle: AppLightStyle.activeDayStyle,
  //           decoration: const BoxDecoration(
  //             color: ColorsManager.white,
  //             borderRadius: BorderRadius.all(Radius.circular(8)),
  //           ),
  //         ),
  //         todayStyle: DayStyle(
  //           dayNumStyle: AppLightStyle.todayDayStyle,
  //           dayStrStyle: AppLightStyle.todayDayStyle,
  //           decoration: const BoxDecoration(
  //             color: ColorsManager.white,
  //             borderRadius: BorderRadius.all(Radius.circular(8)),
  //           ),
  //         ),
  //         inactiveDayStyle: DayStyle(
  //           dayNumStyle: AppLightStyle.inactiveDayStyle,
  //           dayStrStyle: AppLightStyle.inactiveDayStyle,
  //           decoration: const BoxDecoration(
  //             color: ColorsManager.white,
  //             borderRadius: BorderRadius.all(Radius.circular(8)),
  //           ),
  //         ),
  //       ),
  //     );

  Widget buildCalenderTimeLine() => EasyInfiniteDateTimeLine(
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        focusDate: calenderSelectedDate,
        lastDate: DateTime.now().add(const Duration(days: 365)),
        onDateChange: (selectedDate) {},
        itemBuilder: (context, date, isSelected, onTap) {
          return InkWell(
            onTap: () {
              calenderSelectedDate = date; // 3 11 2024
              getTodoFromFireStore();
              setState(() {});
            },
            child: Card(
              color: ColorsManager.white,
              elevation: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${date.day}',
                    style: isSelected
                        ? AppLightStyle.todayDayStyle
                        : AppLightStyle.inactiveDayStyle,
                  ),
                  Text(
                    date.getDayName,
                    style: isSelected
                        ? AppLightStyle.todayDayStyle
                        : AppLightStyle.inactiveDayStyle,
                  )
                ],
              ),
            ),
          );
        },
      );

   void getTodoFromFireStore() async {
    CollectionReference todoCollection =
        FirebaseFirestore.instance.collection(UserDM.collectionName).doc(UserDM.currentUser!.id).collection(TodoDM.collectionName);

    QuerySnapshot collectionSnapshot = await todoCollection
        .where('dateTime',
            isEqualTo: calenderSelectedDate.copyWith(
                hour: 0, minute: 0, microsecond: 0, millisecond: 0, second: 0))
        .get();

    List<QueryDocumentSnapshot> documentSnapShot = collectionSnapshot.docs;
    todoList = documentSnapShot.map((docSnapShot) {
      Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
      TodoDM todo = TodoDM.fromFireStore(json);
      return todo;
    }).toList();

    //todoList = todoList
    //  .where((todo) =>
    //    todo.dateTime.day == calenderSelectedDate &&
    //   todo.dateTime.month == calenderSelectedDate &&
    //    todo.dateTime.year == calenderSelectedDate)
    // .toList();

    setState(() {});
  }
}
