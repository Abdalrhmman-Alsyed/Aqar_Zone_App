import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart'; // تأكد من أن هذا المسار صحيح حسب هيكل مشروعك

class ChangeLang extends StatelessWidget {
  const ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcome to Aqar Zone'.tr(), // استخدم tr() للترجمة
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(Locale('en'));
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('English'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await context.setLocale(Locale('ar'));
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('العربية'),
            ),
          ],
        ),
      ),
    );
  }
}
