import 'dart:async';
// import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:schoolruns/core/network/network_info.dart';
import 'package:schoolruns/core/utils/database_helper.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';
import '../../core/app_export.dart';

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();
  factory ConnectivityService() => _instance;
  ConnectivityService._internal();

  StreamSubscription? _subscription;

  void startSyncListener() {
    // Avoid multiple subscriptions
    _subscription?.cancel();
    final networkInfo = NetworkInfo();
    _subscription = networkInfo.onConnectivityChanged.listen((_) async {
      if (await networkInfo.isConnected()) {
        Get.snackbar(
          'Welcome Back!!!',
          'your back online.',
          colorText: Colors.white,
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,
        );
        await _syncQueuedRequests();
        // Get.snackbar()
      } else {
        Get.snackbar(
          'Oops!!!',
          'your offline.',
          colorText: Colors.white,
          backgroundColor: Colors.yellow,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }

  Future<void> _syncQueuedRequests() async {
    Get.snackbar('Sync', 'checking for syncs');
    final networkInfo = NetworkInfo();
    if (await networkInfo.isConnected()) {
      final requests = await OfflineQueueDB().getAllRequests();
    requests.isEmpty ?  Get.snackbar('Up To date', 'nothing to sync.') : Get.snackbar('Sync Data', requests.toString());
      for (final req in requests) {
        try {
          Get.snackbar(
            'Sync',
            'Starting sync.',
            colorText: Colors.white,
            backgroundColor: Colors.deepOrange,
            snackPosition: SnackPosition.BOTTOM,
          );
          // Replace with your actual API service
          await ApiClient(Duration(seconds: 60 * 5)).attendance(req);
        } catch (e) {
          Get.snackbar(
            'Oops!!!',
            'Error while synchronizing \n $e.',
            colorText: Colors.white,
            backgroundColor: Colors.redAccent,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
      await OfflineQueueDB().clearQueue();
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}
