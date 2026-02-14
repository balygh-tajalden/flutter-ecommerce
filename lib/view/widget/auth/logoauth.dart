import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/imagasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAsset.logo, height: 170);
  }
}
