import 'package:aqar_zone_application/view/screen/Auth/confirm_number.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/static/app_colors.dart';
import '../../widget/password_field_widght.dart';
import '../../widget/rich_text_widght.dart';
import '../../widget/text_field_widght.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({Key? key}) : super(key: key);

  @override
  State<RegisterAccount> createState() => _AgreementScreenState();
}

final List<Map<String, String>> countries = [
  {'name': 'سوريا', 'code': '+963'},
  {'name': 'السعودية', 'code': '+966'},
  {'name': 'مصر', 'code': '+20'},
  {'name': 'الإمارات', 'code': '+971'},
  {'name': 'قطر', 'code': '+974'},
];

String selectedCode = '+963';

class _AgreementScreenState extends State<RegisterAccount> {
  bool isChecked = false;

  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userNameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confPasswordFormKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confPassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create_an_account'.tr()),
        centerTitle: true,
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "images/AqarZoneBlue1.png",
                width: 500,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Text(
                'create_an_account_using_mobile_number'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              TextFieldWidght(
                text: 'enter_user_name'.tr(),
                keyboard: TextInputType.text,
                textEditingController: userName,
                formKey: userNameFormKey,
              ),
              const SizedBox(height: 20),
              TextFieldWidght(
                text: 'enter_email'.tr(),
                keyboard: TextInputType.emailAddress,
                textEditingController: email,
                formKey: emailFormKey,
              ),
              const SizedBox(height: 20),
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
                    child: TextFieldWidght(
                      text: 'phone_hint'.tr(),
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
              PasswordFieldWight(
                text: 'enter_the_password'.tr(),
                textEditingController: confPassword,
                formKey: confPasswordFormKey,
              ),
              const SizedBox(height: 20),
              RichTextWidght(
                text1: "By_clicking_'Ok',_you_agree_to_our".tr(),
                text2: "Terms".tr(),
                text3: "Privacy_Policy".tr(),
                text4: "to_Aqar_Zone".tr(),
                text5: "and".tr(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: AppColors.blue,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    "I_agree-to_the_terms_and_conditions".tr(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (userNameFormKey.currentState!.validate() &&
                        emailFormKey.currentState!.validate() &&
                        phoneFormKey.currentState!.validate() &&
                        passwordFormKey.currentState!.validate() &&
                        confPasswordFormKey.currentState!.validate() &&
                        isChecked) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConfirmNumber()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("الرجاء تعبئة جميع الحقول بشكل صحيح")),
                      );
                    }

                    if (password.text != confPassword.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("كلمتا المرور غير متطابقتين")),
                      );
                      return;
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                  ),
                  child: Text("تسجيل الحساب".tr()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
