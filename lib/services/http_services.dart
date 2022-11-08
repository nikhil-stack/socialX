import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'store_locally.dart';

class HttpServices {
  static const storage = FlutterSecureStorage();

  Future getService() async {
    const baseUrl = 'https://newsapi.org/';
    const api =
        'v2/top-headlines?country=us&category=business&apiKey=63984f4214b44c3485cb84844a3190b7';
    try {
      Response response = await get(Uri.parse(baseUrl + api));
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          await storage.write(key: 'listOfItems', value: jsonEncode(data));

          return data;
        default:
          throw Exception;
      }
    } on SocketException catch (_) {
      String? jsonData = await storage.read(key: 'listOfItems');
      return jsonDecode(jsonData);
    }
  }
}
