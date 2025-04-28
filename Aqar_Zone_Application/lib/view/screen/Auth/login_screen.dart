import 'package:aqar_zone_application/core/static/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // قائمة الدول
  final List<Map<String, String>> countries = [
    {'name': 'سوريا', 'code': '+963'},
    {'name': 'السعودية', 'code': '+966'},
    {'name': 'مصر', 'code': '+20'},
    {'name': 'الإمارات', 'code': '+971'},
    {'name': 'قطر', 'code': '+974'},
  ];

  String selectedCode = '+963'; // الكود الافتراضي




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 220),
              Image.asset(
                'assets/keyfinder_logo.png',
                height: 80,
              ),
              const SizedBox(height: 20),
              Text(
                'login_title'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedCode,
                      underline: const SizedBox(),
                      isExpanded: true,
                      items: countries.map((country) {
                        return DropdownMenuItem<String>(
                          value: country['code'],
                          child: Text(country['code']!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCode = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'phone_hint'.tr(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'login'.tr(),
                    style: const TextStyle(fontSize: 18,color: AppColors.gray),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  'create_account'.tr(),
                  style: TextStyle(
                    color: AppColors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
                label: Text('skip_guest'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
