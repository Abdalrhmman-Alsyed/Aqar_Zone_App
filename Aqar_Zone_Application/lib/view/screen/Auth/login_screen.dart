import 'package:aqar_zone_application/core/static/app_colors.dart';
import 'package:aqar_zone_application/view/screen/Auth/change_lang.dart';
import 'package:aqar_zone_application/view/screen/Auth/register_account.dart';
import 'package:aqar_zone_application/view/widget/text_field_widght.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widget/button_widght_scafold_message.dart';
import '../../widget/password_field_widght.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<Map<String, String>> countries = [
    {'name': 'سوريا', 'code': '+963'},
    {'name': 'السعودية', 'code': '+966'},
    {'name': 'مصر', 'code': '+20'},
    {'name': 'الإمارات', 'code': '+971'},
    {'name': 'قطر', 'code': '+974'},
  ];

  String selectedCode = '+963';

  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        "images/AqarZoneBlue1.png",
                        width: 400,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'login_to_aqar_zone'.tr(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
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
                            child: TextFieldWidght(
                              text: 'enter_the_number_phone'.tr(),
                              keyboard: TextInputType.phone,
                              textEditingController: phone,
                              formKey: phoneFormKey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PasswordFieldWight(
                        text: 'enter_the_password'.tr(),
                        textEditingController: password,
                        formKey: passwordFormKey,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonWidghtScafoldMessage(
                          nextPage: ChangeLang(),
                          isChecked: true,
                          theMessage: "successfully".tr(),
                          formKeys: [phoneFormKey, passwordFormKey],
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterAccount(),
                          ));
                        },
                        child: Text(
                          'create_an_account_using_mobile'.tr(),
                          style: TextStyle(
                            color: AppColors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
                label: Text('skip_and_continue_as_guest'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
