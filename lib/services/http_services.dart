import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart';

class HttpServices {
  Future getService() async {
    const baseUrl = 'https://newsapi.org/';
    const api = 'v2/top-headlines?country=us&category=business&apiKey=63984f4214b44c3485cb84844a3190b7';
    try {
      Response response = await get(Uri.parse(baseUrl+api));
      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          return data;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
