import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/home/tabs/settings_tab//settings_tab.dart';
import 'package:todolist_app/presentation/home/tabs/tasks_tab/tasks_tab.dart';
import 'package:todolist_app/presentation/home/task_bottom_sheet/task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [];
  GlobalKey<TasksTabState> tasksTabKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [TasksTab(key: tasksTabKey,),
      SettingsTab()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: buildFeb(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
      body: tabs[currentIndex],
    );
  }

  Widget buildBottomNavigationBar() => BottomAppBar(
        notchMargin: 10,
         clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: currentIndex,
            onTap: (tappedIndex) {
              currentIndex = tappedIndex;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(Icons.list)),
                  label: 'List'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Icon(
                      Icons.settings,
                    ),
                  ),
                  label: 'Settings')
            ]),
      );

  buildFeb() => FloatingActionButton(
        onPressed: () async{
          await TaskBottomSheet.show(context);
           tasksTabKey.currentState?.getTodoFromFireStore();
        },
        child: const Icon(Icons.add),
      );


}
