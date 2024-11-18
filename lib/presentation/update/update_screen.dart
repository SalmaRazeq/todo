
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/firebase/firebase_function.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todolist_app/core/utils/date_utils.dart';
import 'package:todolist_app/database_manager/model/todo_dm.dart';
import 'package:todolist_app/presentation/home/tabs/tasks_tab/widget/list_item.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var allData = ModalRoute.of(context)!.settings.arguments as DataUpdate;
    var data =  ModalRoute.of(context)!.settings.arguments as TodoDM;
    var formatedDate = data.dateTime.toFormattedDate;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.taskTab),
      ),
      body: Stack(
        children: [
          Container(
            height: 90.h,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            margin: const EdgeInsets.only(left: 27, right: 27, top: 35),
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 17),
            height: 617.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(15.r)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Text(AppLocalizations.of(context)!.editTask, style: AppLightStyle.updateHeader ,textAlign: TextAlign.center,),
                  SizedBox(height: 40.h,),
                  Text(AppLocalizations.of(context)!.taskTitle, style: AppLightStyle.updateTextStyle,),
                  TextFormField(
                    initialValue: data.taskTitle,
                    onChanged: (value){
                      data.taskTitle = value;
                    },
                  ),
                  SizedBox(height: 25.h,),
                  Text(AppLocalizations.of(context)!.taskDetails, style: AppLightStyle.updateTextStyle,),
                  TextFormField(
                    initialValue: data.description,
                    onChanged: (value){
                      data.description = value;
                    },
                  ),
                   SizedBox(height: 25.h,),
                   Text(AppLocalizations.of(context)!.selectDate, style: AppLightStyle.updateTextStyle,),
                  SizedBox(height: 25.h,),

                  InkWell(
                      onTap: () async{
                       var chooseDate = await showDatePicker(context: context, firstDate: DateTime.now(), initialDate: data.dateTime,
                           lastDate: DateTime.now().add(const Duration(days: 365)) );
                       if(chooseDate != null) {
                         data.dateTime = chooseDate;
                       }
                      },

                      child: Text(formatedDate, style: AppLightStyle.updateTextStyle?.copyWith(fontSize: 17),textAlign: TextAlign.center)),
                  SizedBox(height: 115.h),

                  ElevatedButton(
                    onPressed: () async{
                     await FirebaseFunction.updateTask(data);

                    },
                    child:  Text(AppLocalizations.of(context)!.saveChangesButton ,style: AppLightStyle.buttonTextStyle,),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
