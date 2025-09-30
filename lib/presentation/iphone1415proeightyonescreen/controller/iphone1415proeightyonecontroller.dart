import 'dart:async';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schoolruns/core/utils/database_helper.dart';
import 'package:schoolruns/core/utils/storage.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';
import '../../../core/app_export.dart';
import '../models/iphone1415proeightyonemodel.dart';
import 'dart:developer' as myLog;

/// A controller class for the Iphone1415ProEightyoneScreen.
///
/// This class manages the state of the Iphone1415ProEightyoneScreen, including the
/// current iphone1415ProEightyoneModelObj
class Iphone1415ProEightyoneController extends GetxController {
  Rx<Iphone1415ProEightyoneModel> iphone1415ProEightyoneModelObj =
      Iphone1415ProEightyoneModel().obs;

  ApiClient _apiService = ApiClient(Duration(seconds: 60 * 5));


StreamSubscription? _connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    // Listen for connectivity changes
    final networkInfo = NetworkInfo();
    _connectivitySubscription = networkInfo.onConnectivityChanged.listen((_) {
      syncQueuedRequests();
    });
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    super.onClose();
  }

  void syncQueuedRequests() async {
    final networkInfo = NetworkInfo();
    if (await networkInfo.isConnected()) {
      final requests = await OfflineQueueDB().getAllRequests();
      for (final req in requests) {
        try {
          await _apiService.attendance(req);
        } catch (_) {}
      }
      await OfflineQueueDB().clearQueue();
    }
  }

  // Future<void> checkIn() async {
  //   OverlayLoadingProgress.start(context: Get.context!);
  //   OverlayLoadingProgress.start();
  //   var schoolCode = await dataBase.getBrmCode();
  //   final body = {
  //     "schoolCode": schoolCode,
  //     "cardUID": "123456789",
  //     "eventType": 3,
  //     "eventDateTime":
  //         DateTime.now().toIso8601String(), //.toUtc().toIso8601String(),
  //     "notes": "",
  //   };

  //   try {
  //     final response = await _apiService.attendance(body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       myLog.log(response.body);
  //        OverlayLoadingProgress.stop();
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
  //     //  OverlayLoadingProgress.stop();
  //   } finally {
  //     //  OverlayLoadingProgress.stop();
  //   }
  // }


  Future<void> checkIn() async {
  OverlayLoadingProgress.start(context: Get.context!);
  var schoolCode = await dataBase.getBrmCode();
  final body = {
    "schoolCode": schoolCode,
    "cardUID": "123456789",
    "eventType": 3,
    "eventDateTime": DateTime.now().toIso8601String(),
    "notes": "",
  };

try{
  final networkInfo = NetworkInfo();
  if (await networkInfo.isConnected()) {
    try {
      final response = await _apiService.attendance(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        myLog.log(response.body);
        Get.snackbar(
          'success',
          'Check-In successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed(AppRoutes.accountCreationScreen);
      }
    } catch (e) {
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
  } else {
    await OfflineQueueDB().addRequest(body);
    Get.snackbar(
      'Offline',
      'Request saved. Will sync when online.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
    OverlayLoadingProgress.stop();
  }
  }catch(e){
  Get.snackbar(
    'Error',
    e.toString(),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
  OverlayLoadingProgress.stop();
  }
}

// void syncQueuedRequests() async {
//   final networkInfo = NetworkInfo();
//   if (await networkInfo.isConnected()) {
//     final requests = await OfflineQueueDB().getAllRequests();
//     for (final req in requests) {
//       try {
//         await _apiService.attendance(req);
//       } catch (_) {}
//     }
//     await OfflineQueueDB().clearQueue();
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
  //     // OverlayLoadingProgress.stop();
  //   } finally {
  //     //  OverlayLoadingProgress.stop();
  //   }
  // }

  Future<void> checkOut() async {
  OverlayLoadingProgress.start(context: Get.context!);
  var schoolCode = await dataBase.getBrmCode();
  final body = {
    "schoolCode": schoolCode,
    "cardUID": "123456789",
    "eventType": 4,
    "eventDateTime": DateTime.now().toIso8601String(),
    "notes": "",
  };
try{
  final networkInfo = NetworkInfo();
  if (await networkInfo.isConnected()) {
    try {
      final response = await _apiService.attendance(body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        myLog.log(response.body);
        Get.snackbar(
          'success',
          'Check-out successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed(AppRoutes.accountCreationScreen);
      }
    } catch (e) {
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
  } else {
    await OfflineQueueDB().addRequest(body);
    Get.snackbar(
      'Offline',
      'Request saved. Will sync when online.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
    );
    OverlayLoadingProgress.stop();
  }
  }catch(e){
  Get.snackbar(
    'Error',
    e.toString(),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
  OverlayLoadingProgress.stop();
  }
}
}
