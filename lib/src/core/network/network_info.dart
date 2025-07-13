import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';


/// Abstract class to define network check contract
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Concrete implementation using connectivity_plus and socket lookup
class NetworkInfoImpl extends NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    // Check for network availability
    final result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) return false;

    try {
      // Try resolving a known address to confirm actual internet connection
      final socket = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 2));

      return socket.isNotEmpty && socket[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
