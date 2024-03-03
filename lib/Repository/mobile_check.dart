import 'dart:convert';
import 'package:flutter/services.dart';

class MobileExistRepository {
  static Future<dynamic> loadJsonData() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/mobile_exists.json');

      dynamic jsonData = json.decode(jsonString);
         return jsonData;
    } catch (e) {
      // Handle error if JSON file cannot be loaded
      throw Exception('Failed to load JSON data: $e');
    }
  }
}
