import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/static/app_colors.dart';

class ButtonWidghtScafoldMessage extends StatelessWidget {
  final bool isChecked;
  final String theMessage;
  final List<GlobalKey<FormState>> formKeys;
  final Widget nextPage;

  const ButtonWidghtScafoldMessage({
    Key? key,
    required this.isChecked,
    required this.theMessage,
    required this.formKeys,
    required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: () {
        bool allValid =
            formKeys.every((key) => key.currentState?.validate() ?? false);

        if (!allValid) {
          return;
        }

        if (!isChecked) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("accept_terms_message".tr()),
              backgroundColor: AppColors.red,
            ),
          );

          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(theMessage), backgroundColor: AppColors.green),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Text(
        "continue".tr(),
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
