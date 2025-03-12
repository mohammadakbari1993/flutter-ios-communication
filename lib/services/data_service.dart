import 'dart:async';
import 'package:flutter/services.dart';
import '../models/data_packet.dart';

class DataService {
  static const MethodChannel _dataChannel = MethodChannel(
    'com.example.data_channel',
  );

  static Future<DataPacket?> getDataPacket() async {
    try {
      final Map<dynamic, dynamic> result = await _dataChannel.invokeMethod(
        'getDataPacket',
      );
      return DataPacket.fromMap(result);
    } on PlatformException catch (e) {
      print("❌ Data Channel Error: ${e.message}");
      return null;
    }
  }
}
