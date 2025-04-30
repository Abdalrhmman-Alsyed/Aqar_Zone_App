import 'package:aqar_zone_application/core/static/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: AppColors.blue,
        textColor: Colors.white,
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.blue),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
