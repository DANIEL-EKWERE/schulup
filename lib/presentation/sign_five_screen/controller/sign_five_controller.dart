import 'dart:async';
import 'dart:convert';
import 'dart:developer' as myLog;
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schoolruns/core/utils/storage.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';
import '../../../core/app_export.dart';
import '../models/sign_five_model.dart';

/// A controller class for the SignFiveScreen.
///
/// This class manages the state of the SignFiveScreen, including the
/// current signFiveModelObj
class SignFiveController extends GetxController {
  Rx<SignFiveModel> signFiveModelObj = SignFiveModel().obs;

  Rx<bool> isSelectedSwitch = false.obs;

  Rx<bool> isSelectedSwitch1 = false.obs;
  RxString logo = ''.obs;
  RxString name = 'Loading....'.obs;
  RxString cardNo = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getLogo();
    getName();
  }

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  Future<void> logout() async {
    OverlayLoadingProgress.start(context: Get.context!);

    try {
      final response = await _apiService.logOut();
      if (response.statusCode == 200) {
        OverlayLoadingProgress.stop();
        dataBase.logOut();
        Get.offAllNamed(AppRoutes.signThreeScreen);
      } else {
        OverlayLoadingProgress.stop();
        Get.snackbar("Error", "Unable to logout");
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      Get.snackbar("Error", "Unable to logout \n $e");
    } finally {
      OverlayLoadingProgress.stop();
    }
    //Get.offAllNamed(AppRoutes.signTwoScreen);
  }

  Future<void> getLogo() async {
    //  OverlayLoadingProgress.start(context: Get.context!);

    try {
      final response = await _apiService.getSchoolLogo();
      if (response.statusCode == 200) {
        //     OverlayLoadingProgress.stop();
        // Handle successful logo retrieval
        print(response.body);
        //} else {
        OverlayLoadingProgress.stop();
        var responseBody = jsonDecode(response.body);
        var logoUrl = responseBody['logoUrl'];
        logo.value = logoUrl;
        print(logo.value);
        myLog.log(logo.value);
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      Get.snackbar("Error", "Unable to retrieve logo \n $e");
    } finally {
      // OverlayLoadingProgress.stop();
    }
  }

  Future<void> getName() async {
    //  OverlayLoadingProgress.start(context: Get.context!);

    try {
      final response = await _apiService.getSchoolName();
      if (response.statusCode == 200) {
        //  OverlayLoadingProgress.stop();
        // Handle successful logo retrieval
        print(response.body);
        var responseBody = jsonDecode(response.body);
        var schoolName = responseBody['data'];
        name.value = schoolName;
        print(name.value);
      } else {
        //   OverlayLoadingProgress.stop();
        Get.snackbar("Error", "Unable to retrieve logo");
      }
    } catch (e) {
      //  OverlayLoadingProgress.stop();
      Get.snackbar("Error", "Unable to retrieve logo \n $e");
    } finally {
      //  OverlayLoadingProgress.stop();
    }
  }

  Future<void> registerCard(String cardId) async {
    OverlayLoadingProgress.start(context: Get.context!);
    var schoolCode = await dataBase.getBrmCode();
    try {
      final body = {
        "schoolCode": schoolCode,
        "cardUID": cardId,
        "UserNo": "021/0103",
      };

      final response = await _apiService.regCard(body);
      if (response.statusCode == 200) {
        //  OverlayLoadingProgress.stop();
        // Handle successful logo retrieval
        print(response.body);
        // var responseBody = jsonDecode(response.body);
        // var schoolName = responseBody['data'];
        // name.value = schoolName;
        // print(name.value);
        var responseBody = jsonDecode(response.body);
        print(responseBody);

        Get.toNamed(AppRoutes.accountCreationScreen);
        // !.then((value) {
          Timer(const Duration(seconds: 4), () {
           Get.snackbar(
          'Success',
          responseBody['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
          });
        // });
        // Get.snackbar(
        //   'Success',
        //   responseBody['message'],
        //   snackPosition: SnackPosition.BOTTOM,
        //   backgroundColor: Colors.green,
        //   colorText: Colors.white,
        // );
      } else {
        //   OverlayLoadingProgress.stop();
        Get.snackbar("Error", "Unable to retrieve register card");
        var responseBody = jsonDecode(response.body);
        print(responseBody);
        print(response.body);
        print(response.statusCode);
      }
    } catch (e) {
      //  OverlayLoadingProgress.stop();
      myLog.log("Unable to retrieve register card \n $e");
      Get.snackbar("Error", "Unable to retrieve register card \n $e");
    } finally {
      OverlayLoadingProgress.stop();
    }
  }
}
