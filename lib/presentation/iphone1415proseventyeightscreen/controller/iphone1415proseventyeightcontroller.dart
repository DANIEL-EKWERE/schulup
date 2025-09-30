import 'dart:async';

import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schoolruns/core/utils/database_helper.dart';
import 'package:schoolruns/core/utils/storage.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';
import '../../../core/app_export.dart';
import '../models/iphone1415proseventyeightmodel.dart';
import 'dart:developer' as myLog;

/// A controller class for the Iphone1415ProSeventyeightScreen.
///
/// This class manages the state of the Iphone1415ProSeventyeightScreen, including the
/// current iphone1415ProSeventyeightModelObj
class Iphone1415ProSeventyeightController extends GetxController {
  Rx<Iphone1415ProSeventyeightModel> iphone1415ProSeventyeightModelObj =
      Iphone1415ProSeventyeightModel().obs;

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
  // Future<void> dropOff() async {
  //   OverlayLoadingProgress.start(context: Get.context!);
  //   // OverlayLoadingProgress.start();
  //   var schoolCode = await dataBase.getBrmCode();
  //   final body = {
  //     "schoolCode": schoolCode,
  //     "cardUID": "123456789",
  //     "eventType": 1,
  //     "eventDateTime":
  //         DateTime.now().toIso8601String(), //.toUtc().toIso8601String(),
  //     "notes": "",
  //   };

  //   try {
  //     final response = await _apiService.attendance(body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       myLog.log(response.body);

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
  //   } finally {
  //     OverlayLoadingProgress.stop();
  //   }
  // }

  // Future<void> pickUp() async {
  //   OverlayLoadingProgress.start(context: Get.context!);
  //   var schoolCode = await dataBase.getBrmCode();
  //   final body = {
  //     "schoolCode": schoolCode,
  //     "cardUID": "123456789",
  //     "eventType": 2,
  //     "eventDateTime": DateTime.now().toIso8601String(),
  //     "notes": "",
  //   };

  //   try {
  //     final response = await _apiService.attendance(body);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       myLog.log(response.body);

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
  //   } finally {
  //     OverlayLoadingProgress.stop();
  //   }
  // }

  Future<void> dropOff() async {
    OverlayLoadingProgress.start(context: Get.context!);
    var schoolCode = await dataBase.getBrmCode();
    final body = {
      "schoolCode": schoolCode,
      "cardUID": "123456789",
      "eventType": 1,
      "eventDateTime": DateTime.now().toIso8601String(),
      "notes": "",
    };
    try {
      final networkInfo = NetworkInfo();
      if (await networkInfo.isConnected()) {
        try {
          final response = await _apiService.attendance(body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            myLog.log(response.body);
            Get.snackbar(
              'success',
              'Drop-off successful',
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
    } catch (e) {
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

  Future<void> pickUp() async {
    OverlayLoadingProgress.start(context: Get.context!);
    var schoolCode = await dataBase.getBrmCode();
    final body = {
      "schoolCode": schoolCode,
      "cardUID": "123456789",
      "eventType": 2,
      "eventDateTime": DateTime.now().toIso8601String(),
      "notes": "",
    };
    try {
      final networkInfo = NetworkInfo();
      if (await networkInfo.isConnected()) {
        try {
          final response = await _apiService.attendance(body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            myLog.log(response.body);
            Get.snackbar(
              'success',
              'Pick-up successful',
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
    } catch (e) {
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
