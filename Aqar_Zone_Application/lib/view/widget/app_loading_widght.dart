import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/static/app_colors.dart';

class AppLoadingWidget extends StatelessWidget {
  // final String text;
  final double size;

  const AppLoadingWidget({super.key, this.size = 120});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'images/Zone.json', // ضع هنا مسار ملف اللوتي الخاص بك
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
        // Text(
        //   text,
        //   style: const TextStyle(
        //     fontSize: 40,
        //     fontWeight: FontWeight.w700,
        //     color:AppColors.background
        //     // color: Color(0xff0925A5)
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    );
  }
}
