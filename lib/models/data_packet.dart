class DataPacket {
  final int id;
  final String value;
  final DateTime timestamp;

  DataPacket({required this.id, required this.value, required this.timestamp});

  // Convert from Map (iOS -> Flutter)
  factory DataPacket.fromMap(Map<dynamic, dynamic> map) {
    return DataPacket(
      id: map["id"],
      value: map["value"],
      timestamp: DateTime.parse(map["timestamp"]),
    );
  }

  // Convert to Map (Flutter -> iOS)
  Map<String, dynamic> toMap() {
    return {"id": id, "value": value, "timestamp": timestamp.toIso8601String()};
  }
}
