import 'package:flutter/material.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
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
            style: AppLightStyle.headerSettings,
          ),
          const SizedBox(
            height: 17,
          ),
          DropdownMenu<Items>(
            inputDecorationTheme: InputDecorationTheme(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              enabledBorder: const OutlineInputBorder(
                  borderSide:  BorderSide(color: ColorsManager.blue, width: 2)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onPrimary,
            ),
            initialSelection: Items(text: 'Light'),
            controller: textController,
            width: 340,
            hintText: selectedItem.text,
            textStyle: AppLightStyle.mode,
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
            style: AppLightStyle.headerSettings,
          ),
          const SizedBox(
            height: 17,
          ),
          DropdownMenu<Languages>(
            inputDecorationTheme: InputDecorationTheme(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.blue, width: 2)),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onPrimary,
            ),
            initialSelection: Languages(lang: 'English'),
            controller: langController,
            width: 340,
            hintText: selectedLang.lang,
            textStyle: AppLightStyle.mode,
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
