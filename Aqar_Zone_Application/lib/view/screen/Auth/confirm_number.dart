import 'dart:async';

import 'package:aqar_zone_application/core/static/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmNumber extends StatefulWidget {
  const ConfirmNumber({Key? key}) : super(key: key);

  @override
  State<ConfirmNumber> createState() => _ConfirmNumberState();
}

class _ConfirmNumberState extends State<ConfirmNumber> {
  TextEditingController codeController = TextEditingController();
  bool isValid = false;

  int remainingSeconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
    codeController.addListener(() {
      setState(() {
        isValid = codeController.text.length == 4;
      });
    });
  }

  void startCountdown() {
    remainingSeconds = 60;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    codeController.dispose();
    timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("confirm_number".tr()),
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("images/AqarZoneBlue1.png", width: 500),
            Text(
              "enter_verification_code".tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "0934178614",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: codeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.blue,
                fontSize: 24,
                letterSpacing: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: "____",
                hintStyle: const TextStyle(letterSpacing: 20),
              ),
            ),
            const SizedBox(height: 20),
            remainingSeconds > 0
                ? Text("${"resend_after".tr()} ${formatTime(remainingSeconds)}")
                : TextButton(
                    onPressed: () {
                      startCountdown();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("code_resent".tr())),
                      );
                    },
                    child: Text(
                      "resend_code".tr(),
                      style: const TextStyle(
                        color: AppColors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isValid
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("code_verified".tr()),
                            backgroundColor: AppColors.green,
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  "continue".tr(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
