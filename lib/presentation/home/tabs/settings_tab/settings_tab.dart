import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});

  List<Items> items = [
    Items(text: 'Light'),
    Items(text: 'Dark'),
  ];

  List<Languages> languages = [
    Languages(lang: 'English'),
    Languages(lang: 'العربية'),
  ];

  var textController = TextEditingController();
  var langController = TextEditingController();


  Items selectedItem = Items(text: 'Light');
  Languages selectedLang = Languages(lang: 'English');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Text(
            'Mode',
            style: ApplightStyle.headerSettings,
          ),
          const SizedBox(
            height: 17,
          ),
          DropdownMenu<Items>(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              filled: true,
              fillColor: ColorsManager.white,
            ),
            initialSelection: Items(text: 'Light'),
            controller: textController,
            width: 340,
            hintText: selectedItem.text,
            textStyle: ApplightStyle.mode,
            requestFocusOnTap: false,
            enableFilter: true,
            onSelected: (Items? item) {
              selectedItem = item ?? Items(text: 'Light');
            },
            dropdownMenuEntries:
                items.map<DropdownMenuEntry<Items>>((Items item) {
              return DropdownMenuEntry<Items>(
                value: item,
                label: item.text,
              );
            }).toList(),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            'Language',
            style: ApplightStyle.headerSettings,
          ),
          const SizedBox(
            height: 17,
          ),
          DropdownMenu<Languages>(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              filled: true,
              fillColor: ColorsManager.white,
            ),
            initialSelection: Languages(lang: 'English'),
            controller: langController,
            width: 340,
            hintText: selectedLang.lang,
            textStyle: ApplightStyle.mode,
            requestFocusOnTap: false,
            enableFilter: true,
            onSelected: (Languages? lang) {
              selectedLang = lang ?? Languages(lang: 'English');
            },
            dropdownMenuEntries:
                languages.map<DropdownMenuEntry<Languages>>((Languages language) {
              return DropdownMenuEntry<Languages>(
                value: language,
                label: language.lang,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class Items {
  String text;

  Items({required this.text});
}

class Languages {
  String lang;

  Languages({required this.lang});
}
