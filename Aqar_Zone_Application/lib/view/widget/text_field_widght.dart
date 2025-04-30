import 'package:aqar_zone_application/core/static/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextFieldWidght extends StatelessWidget {
  final String text;
  final TextEditingController textEditingController;
  final TextInputType keyboard;
  final GlobalKey<FormState> formKey;

  const TextFieldWidght({
    super.key,
    required this.text,
    required this.textEditingController,
    required this.keyboard,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboard,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          hintText: text.tr(),
          hintStyle: TextStyle(color: AppColors.gray),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'empty_field_error'.tr();
          }
          return null;
        },
      ),
    );
  }
}
