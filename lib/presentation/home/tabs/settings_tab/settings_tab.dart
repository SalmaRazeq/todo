import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todolist_app/core/utils/app_textStyle.dart';
import 'package:todolist_app/core/utils/color_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsTab),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Text(
              AppLocalizations.of(context)!.mode,
              style: AppLightStyle.headerSettings,
            ),
            const SizedBox(
              height: 17,
            ),
            DropdownMenu<Items>(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.blue, width: 2.w)),
                enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: ColorsManager.blue, width: 2.w)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.blue, width: 2.w)),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
              ),
              initialSelection: Items(text: AppLocalizations.of(context)!.light),
              controller: textController,
              width: 340.w,
              hintText: selectedItem.text,
              textStyle: AppLightStyle.mode,
              requestFocusOnTap: false,
              enableFilter: true,
              onSelected: (Items? item) {
                selectedItem = item ?? Items(text: AppLocalizations.of(context)!.light);
              },
              dropdownMenuEntries:
                  items.map<DropdownMenuEntry<Items>>((Items item) {
                return DropdownMenuEntry<Items>(
                  value: item,
                  label: item.text,
                );
              }).toList(),
            ),
             SizedBox(
              height: 35.h,
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: AppLightStyle.headerSettings,
            ),
            SizedBox(
              height: 17.h,
            ),
            DropdownMenu<Languages>(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.blue, width: 2.w)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.blue, width: 2.w)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.blue, width: 2.w)),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
              ),
              initialSelection: Languages(lang: 'English'),
              controller: langController,
              width: 340.w,
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
