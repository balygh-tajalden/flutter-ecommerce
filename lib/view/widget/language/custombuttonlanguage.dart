import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLanguage({
    super.key,
    required this.textbutton,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,

        child: Text(textbutton, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
