import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schoolruns/core/utils/storage.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';
import '../../../core/app_export.dart';
import '../models/sign_two_model.dart';
import 'dart:developer' as myLog;

/// A controller class for the SignTwoScreen.
///
/// This class manages the state of the SignTwoScreen, including the
/// current signTwoModelObj
class SignTwoController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<SignTwoModel> signTwoModelObj = SignTwoModel().obs;
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));
  Rx<bool> isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }

  Future<void> secondLogin() async {
    OverlayLoadingProgress.start(context: Get.context!);
    var schoolcode = await dataBase.getBrmCode();
    myLog.log('school code: $schoolcode');
    try {
      final body = {
        "username": usernameController.text,
        "password": passwordController.text,
        "schoolCode": schoolcode,
      };

      final response = await _apiService.firstLogin(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        myLog.log('login successful: ${response.body}');
        
        Get.offAllNamed(AppRoutes.iphone1415ProFiftythreeScreen);

        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        Get.offAllNamed(AppRoutes.signTwoScreen);

        var responseData = jsonDecode(response.body);
        var message = responseData['message'];
        Get.snackbar(
          'Error',
          message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // OverlayLoadingProgress.stop();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
