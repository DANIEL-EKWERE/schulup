import 'dart:async';

import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/account_creation_model.dart';

/// A controller class for the AccountCreationScreen.
///
/// This class manages the state of the AccountCreationScreen, including the
/// current accountCreationModelObj
class AccountCreationController extends GetxController {
  Rx<AccountCreationModel> accountCreationModelObj = AccountCreationModel().obs;

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.back();
    });
  }
}
