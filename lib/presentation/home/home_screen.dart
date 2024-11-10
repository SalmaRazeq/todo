import 'package:flutter/material.dart';
import 'package:todolist_app/presentation/home/tabs/list_tab//list_tab.dart';
import 'package:todolist_app/presentation/home/tabs/settings_tab//settings_tab.dart';
import 'package:todolist_app/presentation/home/task_bottom_sheet/task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [const ListTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: tabs[currentIndex],
      floatingActionButton: buildFeb(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
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
        onPressed: () {
          showTaskBottomSheet();
        },
        child: const Icon(Icons.add),
      );

  void showTaskBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) => TaskBotoomSheet.show(),);
  }
}
