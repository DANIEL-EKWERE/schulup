import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/sign_up_welcome_model.dart';

/// A controller class for the SignUpWelcomeScreen.
///
/// This class manages the state of the SignUpWelcomeScreen, including the
/// current signUpWelcomeModelObj
class SignUpWelcomeController extends GetxController {
  Rx<SignUpWelcomeModel> signUpWelcomeModelObj = SignUpWelcomeModel().obs;
}
