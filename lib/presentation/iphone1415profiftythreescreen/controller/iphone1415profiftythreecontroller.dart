import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schoolruns/core/utils/storage.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/iphone1415profiftythreemodel.dart';
import 'dart:developer' as myLog;

/// A controller class for the Iphone1415ProFiftythreeScreen.
///
/// This class manages the state of the Iphone1415ProFiftythreeScreen, including the
/// current iphone1415ProFiftythreeModelObj
class Iphone1415ProFiftythreeController extends GetxController {
  Rx<Iphone1415ProFiftythreeModel> iphone1415ProFiftythreeModelObj =
      Iphone1415ProFiftythreeModel().obs;

  Completer<GoogleMapController> googleMapController = Completer();

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element
        in iphone1415ProFiftythreeModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    iphone1415ProFiftythreeModelObj.value.dropdownItemList.refresh();
  }

  Rx<bool> isSelectedSwitch1 = false.obs;
  RxString logo = ''.obs;
  RxString name = 'Loading....'.obs;

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
        var responseBody = jsonDecode(response.body);
        var logoUrl = responseBody['logoUrl'];
        logo.value = logoUrl;
        print(logo.value);
        myLog.log(logo.value);
        //} else {
        await dataBase.saveLogo(logoUrl);

        OverlayLoadingProgress.stop();
        // Get.snackbar("Error", "retrieve logo Successfully",
        //     snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: Colors.green,
        //     colorText: Colors.white);
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
        dynamic result = await dataBase.saveFullName(schoolName);
        myLog.log(result.toString());
        var name1 = await dataBase.getFullName();
        myLog.log(name1);
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

  // ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));

  // Future<void> checkIn() async {
  //   OverlayLoadingProgress.start(context: Get.context!);
  //   var schoolCode = await dataBase.getBrmCode();
  //   final body = {
  //     "schoolCode": schoolCode,
  //     "cardUID": "123456789",
  //     "eventType": 3,
  //     "eventDateTime": DateTime.now().toIso8601String(), //.toUtc().toIso8601String(),
  //     "notes": "",
  //   };

  //   try {
  //     final response = await _apiService.attendance(body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       myLog.log(response.body);
  //       OverlayLoadingProgress.stop();
  //       Get.toNamed(AppRoutes.accountCreationScreen);
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     OverlayLoadingProgress.stop();
  //   } finally {
  //     //  OverlayLoadingProgress.stop();
  //   }
  // }

  // Future<void> checkOut() async {
  //   OverlayLoadingProgress.start(context: Get.context!);
  //   var schoolCode = await dataBase.getBrmCode();
  //   final body = {
  //     "schoolCode": schoolCode,
  //     "cardUID": "123456789",
  //     "eventType": 4,
  //     "eventDateTime": DateTime.now().toIso8601String(),
  //     "notes": "",
  //   };

  //   try {
  //     final response = await _apiService.attendance(body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       myLog.log(response.body);
  //       OverlayLoadingProgress.stop();
  //       Get.toNamed(AppRoutes.accountCreationScreen);
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     OverlayLoadingProgress.stop();
  //   } finally {
  //     OverlayLoadingProgress.stop();
  //   }
  // }
}
