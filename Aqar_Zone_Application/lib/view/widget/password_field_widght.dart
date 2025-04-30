import 'package:aqar_zone_application/core/static/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordFieldWight extends StatefulWidget {
  PasswordFieldWight({
    required this.text,
    required this.textEditingController,
    required this.formKey,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;

  @override
  State<PasswordFieldWight> createState() => _PasswordFieldWightState();
}

class _PasswordFieldWightState extends State<PasswordFieldWight> {
  bool passwordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: 1,
        ),
        obscureText: passwordObscured,
        controller: widget.textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'password_required'.tr();
          } else if (value.length <= 3) {
            return 'password_too_short'.tr();
          }
          return null;
        },
        decoration: InputDecoration(
          hintStyle: TextStyle(color: AppColors.gray),
          hintText: widget.text.tr(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                passwordObscured = !passwordObscured;
              });
            },
            icon: Icon(passwordObscured
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
          ),
        ),
      ),
    );
  }
}
