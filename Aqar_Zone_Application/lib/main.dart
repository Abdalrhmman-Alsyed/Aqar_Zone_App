import 'package:aqar_zone_application/view/screen/setting/setting_panel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('ar', ''), Locale('en', '')],
      path: "assets/lang",
      fallbackLocale: Locale('en', ''),
      startLocale: null,
      child: CookApp()));
}

class CookApp extends StatelessWidget {
  const CookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SettingPanel(),
    );
  }
}
