import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/functions/alertexitapp.dart';

class ConfirmExitScope extends StatelessWidget {
  final Widget child;

  const ConfirmExitScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) {
          return;
        }

        final bool shouldExit = await alertExitApp();

        if (shouldExit) {
          exit(0);
        }
      },
      child: child,
    );
  }
}
