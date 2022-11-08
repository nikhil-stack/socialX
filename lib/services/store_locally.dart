// import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class StoreLocally {
//   static const storage = FlutterSecureStorage();

//   void writeData(dynamic data) async {
//     await storage.write(key: 'listOfItems', value: jsonEncode(data));
//   }

//   Future<List<dynamic>> readData() async {
//     String? jsonData = await storage.read(key: 'listOfItems');
//     List<dynamic> data = jsonDecode(jsonData);

//     return data;
//   }
// }
