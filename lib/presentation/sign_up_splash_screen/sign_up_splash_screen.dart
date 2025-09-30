import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'controller/sign_up_splash_controller.dart'; // ignore_for_file: must_be_immutable

class SignUpSplashScreen extends GetWidget<SignUpSplashController> {
  const SignUpSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.indigoA700,
      body: SafeArea(child: SizedBox(height: 790.h, width: 392.h)),
    );
  }
}
