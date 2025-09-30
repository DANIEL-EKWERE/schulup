import 'dart:async';
import 'package:schoolruns/core/network/network_info.dart';
import 'package:schoolruns/core/utils/database_helper.dart';
import 'package:schoolruns/data/apiClient/api_client.dart';

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
        await _syncQueuedRequests();
      }
    });
  }

  Future<void> _syncQueuedRequests() async {
    final networkInfo = NetworkInfo();
    if (await networkInfo.isConnected()) {
      final requests = await OfflineQueueDB().getAllRequests();
      for (final req in requests) {
        try {
          // Replace with your actual API service
          await ApiClient(Duration(seconds: 60 * 5)).attendance(req);
        } catch (_) {}
      }
      await OfflineQueueDB().clearQueue();
    }
  }

  void dispose() {
    _subscription?.cancel();
  }
}