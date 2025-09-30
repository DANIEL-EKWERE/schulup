import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:schoolruns/core/utils/storage.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';
import '../../../core/app_export.dart';
import '../models/sign_three_model.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'dart:developer' as myLog;

/// A controller class for the SignThreeScreen.
///
/// This class manages the state of the SignThreeScreen, including the
/// current signThreeModelObj
class SignThreeController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController schoolCodeController = TextEditingController();
  RxBool isShowPassword = false.obs;

  Rx<SignThreeModel> signThreeModelObj = SignThreeModel().obs;
  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));
  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    schoolCodeController.dispose();
    usernameController.dispose();
  }

  Future<void> firstLogin() async {
    OverlayLoadingProgress.start(context: Get.context!);
    try {
      final body = {
        "username": usernameController.text,
        "password": passwordController.text,
        "schoolCode": schoolCodeController.text,
      };

      final response = await _apiService.firstLogin(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // OverlayLoadingProgress.stop();
        // myLog.log('Login successful: ${response.body}');
        var responseData = jsonDecode(response.body);
        var token = responseData['data']['token'];
        var userId = responseData['data']['userID'];
        myLog.log('Token: $token');
        dataBase.saveToken(token);
        dataBase.saveUserId(userId);
        dataBase.saveBrmCode(schoolCodeController.text);
        Get.offAllNamed(AppRoutes.iphone1415ProFiftythreeScreen);
        OverlayLoadingProgress.stop();
        //   Get.toNamed(AppRoutes.signFourScreen);
      } else if (response.statusCode == 404 || response.statusCode == 401) {
        //Get.offAllNamed(AppRoutes.signTwoScreen);
        OverlayLoadingProgress.stop();
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
        OverlayLoadingProgress.stop();
        Get.snackbar(
          'Error',
          'Login failed. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      //OverlayLoadingProgress.stop();
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
