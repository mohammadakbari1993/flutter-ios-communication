# 🚀 Flutter-iOS Communication App

A **Flutter-iOS hybrid project** that enables communication between Flutter and iOS using **Method Channels**, **MVC architecture**, and **Factory design pattern**.

## 📌 Features
✅ **Method Channel Communication** – Communicate between Flutter and iOS  
✅ **Modular Architecture** – MVC + Factory Pattern  
✅ **Lazy Initialization** – Optimized for performance  


---

## 📂 Project Structure
```
/flutter_app/
 ├── /lib/
 │    ├── /models/           # Data models (e.g., DataPacket.dart)
 │    ├── /services/         # iOS communication handlers
 │    ├── /views/            # Flutter UI components
 │    ├── main.dart          # Flutter entry point
 │
 ├── /ios/
 │    ├── /Runner/
 │    │    ├── /Channels/   	 # Manages method channels
 │    │    ├── /Modules/    	 # DataModule, StatusModule, etc.
 │    │    ├── /Application/     # Manages Factory classes
 │    │    ├── AppDelegate.swift # Registers method channels
 │
 ├── pubspec.yaml            # Flutter dependencies
 ├── README.md               # Project documentation
```

---

## 🚀 **Getting Started**
### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/YOUR_USERNAME/flutter-ios-communication.git
cd flutter-ios-communication
```

### **2️⃣ Install Dependencies**
```bash
flutter pub get
```

### **3️⃣ Run the App**
```bash
flutter run
```

### **4️⃣ Run iOS Project in Xcode**
```bash
open ios/Runner.xcworkspace
```

---

## **📌 iOS Setup**
### ✅ **Register Method Channels in `AppDelegate.swift`**
```swift
let controller = window?.rootViewController as! FlutterViewController

SampleChannels.allCases.forEach { channel in
    let methodChannel = channel.getChannel(controller: controller)
    let module = channel.module
    
    methodChannel.setMethodCallHandler { (call, result) in
        module.handle(call: call, result: result)
    }
}
```

---

## **📌 API Usage**
### **✅ Call `getDataPacket` (Flutter → iOS)**
```dart
const MethodChannel _dataChannel = MethodChannel('com.example.data_channel');

Future<void> fetchData() async {
  final result = await _dataChannel.invokeMethod('getDataPacket');
  print(result);
}
```

### **✅ Call `getStatus` (Flutter → iOS)**
```dart
const MethodChannel _statusChannel = MethodChannel('com.example.status_channel');

Future<void> fetchStatus() async {
  final result = await _statusChannel.invokeMethod('getStatus');
  print(result);
}
```

---

## **🛠 Technologies Used**
| Component | Technology |
|-----------|-----------|
| **Frontend** | Flutter (Dart) |
| **iOS Native** | Swift |
| **Architecture** | MVC, Factory Pattern |
| **State Management (Flutter)** | Provider/Riverpod |
| **Build System** | Xcode + CocoaPods |

---

## **✅ Next Steps**
🔹 Add **Unit Tests** for method channels  
🔹 Implement **Event Channels** for real-time updates  
🔹 Optimize **Error Handling** and logging  

---

## **📌 Contributors**
👨‍💻 **Mohammad Akbari** – *Lead Developer*  
📧 **akbari.mohammad.pst@gmail.com**  

---
