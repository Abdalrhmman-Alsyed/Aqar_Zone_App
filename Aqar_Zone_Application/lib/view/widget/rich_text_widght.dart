import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../screen/Auth/login_screen.dart';

class RichTextWidght extends StatelessWidget {
  RichTextWidght({
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
  });

  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: " $text1 ",
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [
          TextSpan(
            text: " $text2 ",
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
          ),
          TextSpan(
            text: text5,
          ),
          TextSpan(
            text: " $text3 ",
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
          ),
          TextSpan(text: text4, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
