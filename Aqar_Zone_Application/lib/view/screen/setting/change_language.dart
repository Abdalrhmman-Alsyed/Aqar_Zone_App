import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/static/app_colors.dart';

class ChangeLanguage extends StatefulWidget {
  ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _SettingsState();
}

class _SettingsState extends State<ChangeLanguage> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        foregroundColor: Colors.white,
        leading: BackButton(),
        title: Text("Language".tr()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SwitchListTile(
            inactiveThumbColor: AppColors.white,
            activeColor: AppColors.white,
            inactiveTrackColor: AppColors.black,
            activeTrackColor: AppColors.black,
            title: Text(
              "Arabic".tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            value: isSwitch,
            onChanged: (value) {
              setState(() {
                isSwitch = value;
                if (isSwitch) {
                  context.setLocale(Locale('ar'));
                } else
                  context.setLocale(Locale('en'));
              });
            },
          )
        ],
      ),
    );
  }
}
