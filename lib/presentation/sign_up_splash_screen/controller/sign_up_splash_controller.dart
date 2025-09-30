import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/sign_up_splash_model.dart';

/// A controller class for the SignUpSplashScreen.
///
/// This class manages the state of the SignUpSplashScreen, including the
/// current signUpSplashModelObj
class SignUpSplashController extends GetxController {
  Rx<SignUpSplashModel> signUpSplashModelObj = SignUpSplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.signUpWelcomeScreen);
    });
  }
}
