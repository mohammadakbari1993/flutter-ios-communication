import 'package:flutter/services.dart';

class StatusService {
  static const MethodChannel _statusChannel = MethodChannel(
    'com.example.status_channel',
  );

  static Future<Map<String, dynamic>?> getStatus() async {
    try {
      final Map<dynamic, dynamic> result = await _statusChannel.invokeMethod(
        'getStatus',
      );
      return result.cast<String, dynamic>();
    } on PlatformException catch (e) {
      print("❌ Status Channel Error: ${e.message}");
      return null;
    }
  }
}
