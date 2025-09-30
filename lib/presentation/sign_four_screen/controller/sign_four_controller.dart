import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/sign_four_model.dart';

/// A controller class for the SignFourScreen.
///
/// This class manages the state of the SignFourScreen, including the
/// current signFourModelObj
class SignFourController extends GetxController {
  TextEditingController passwordoneController = TextEditingController();

  Rx<SignFourModel> signFourModelObj = SignFourModel().obs;

  @override
  void onClose() {
    super.onClose();
    passwordoneController.dispose();
  }
}
