// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import '../model/location_details.dart';

class LocationApi {
  Future<LocationData> getLocationDetails(String key, String s1) async {
    var client = http.Client();
    LocationData responseData;
    try {
      Map<String, String> queryParams = {
        "where": jsonEncode({
          //  "adminName1": "Maharashtra",
          key: s1,
        })
      };
      var uri = Uri.parse(
              'https://parseapi.back4app.com/classes/Dataset_India_Pin_Code')
          .replace(queryParameters: queryParams);

      var response = await client.get(uri, headers: {
        'X-Parse-Application-Id': 'qfhJwZKbzkmj4Bp87kdizGQCtEBxXO2GP6BHngMr',
        'X-Parse-REST-API-Key': 'sTXzJDJtFGxUxqKVKKYvBTBqEnLIzfmzATH2sW22'
      });

      responseData = LocationData.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
      debugPrint('response is : ${jsonEncode(responseData)}');
      return responseData;
    } finally {
      client.close();
    }
  }
}
