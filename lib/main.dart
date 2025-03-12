import 'dart:async';
import 'package:flutter/material.dart';
import 'models/data_packet.dart';
import 'services/data_service.dart';
import 'services/status_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DataPacket? dataPacket;
  String statusMessage = "Fetching status...";
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    startListeningToData();
    getStatus();
  }

  void startListeningToData() {
    Timer.periodic(Duration(seconds: 2), (timer) async {
      try {
        final DataPacket? packet = await DataService.getDataPacket();
        if (packet == null) throw Exception("Received null data");

        setState(() {
          dataPacket = packet;
          errorMessage = "";
        });
      } catch (e) {
        setState(() {
          errorMessage = "Error fetching data: ${e.toString()}";
        });
      }
    });
  }

  void getStatus() async {
    try {
      final status = await StatusService.getStatus();
      if (status != null) {
        setState(() {
          statusMessage =
              "Status: ${status['status']}, Uptime: ${status['uptime']}";
        });
      } else {
        setState(() {
          statusMessage = "Error fetching status.";
        });
      }
    } catch (e) {
      setState(() {
        statusMessage = "Status Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Multi-Channel Communication")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                statusMessage,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20),
              errorMessage.isNotEmpty
                  ? Text(
                    "⚠ Error: $errorMessage",
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )
                  : dataPacket == null
                  ? CircularProgressIndicator()
                  : Column(
                    children: [
                      Text(
                        "ID: ${dataPacket!.id}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Value: ${dataPacket!.value}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Timestamp: ${dataPacket!.timestamp}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
