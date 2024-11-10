import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:todolist_app/core/utils/date_utils.dart';
import 'package:todolist_app/presentation/home/tabs/list_tab/widget/list_item.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCalenderTimeLine(),
        const ListItem(),
      ],
    );
  }

  Widget buildCalenderTimeLine() => EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {},
        headerProps: const EasyHeaderProps(
            monthPickerType: MonthPickerType.dropDown,
            dateFormatter: DateFormatter.fullDateDMY(),
            showHeader: false),
        dayProps:  const EasyDayProps(
          height: 100,
          width: 70,
          dayStructure: DayStructure.dayStrDayNum,
          activeDayStyle: DayStyle(
            dayNumStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blue),
            dayStrStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: ColorsManager.blue,),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
             ),
          ),
          inactiveDayStyle: DayStyle(
            dayNumStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: ColorsManager.darkGrey),
            dayStrStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: ColorsManager.darkGrey),
            decoration: BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color(0xff3371FF),
              //     Color(0xff8426D6),
              //   ],
              // ),
            ),
          ),
        ),
      );
}
