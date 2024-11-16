
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';


class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
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
                borderRadius: BorderRadius.circular(15)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Text('Edit Task', style: AppLightStyle.updateHeader ,textAlign: TextAlign.center,),
                  SizedBox(height: 40.h,),
                  Text('This is title', style: AppLightStyle.updateTextStyle,),
                  TextFormField(),
                  SizedBox(height: 25.h,),
                  Text('Task details', style: AppLightStyle.updateTextStyle,),
                  TextFormField(),
                   SizedBox(height: 25.h,),
                   Text('Select Time', style: AppLightStyle.updateTextStyle,),
                  SizedBox(height: 25.h,),

                  InkWell(onTap: () {},
                      child: Text('27-6-2021' , style: AppLightStyle.updateTextStyle?.copyWith(fontSize: 17),textAlign: TextAlign.center)),
                  SizedBox(height: 115.h),

                  ElevatedButton(onPressed: (){},
                    child:  Text('Save Change' ,style: AppLightStyle.buttonTextStyle,),
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
