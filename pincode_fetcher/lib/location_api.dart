 import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pincode_fetcher/widgets/model/location_details.dart';
import 'dart:convert';

class LocationApi{

Future<LocationData> getLocationDetails(String s1) async {
 var client = http.Client();
  LocationData responseData;
try {
      Map<String, String> queryParams = {
    "where": jsonEncode({
    //  "adminName1": "Maharashtra",
      "adminName2": s1,
    })
  };
  var uri = Uri.parse('https://parseapi.back4app.com/classes/Dataset_India_Pin_Code').replace(queryParameters:queryParams);

  var response = await client.get(
      uri, headers: {'X-Parse-Application-Id':'qfhJwZKbzkmj4Bp87kdizGQCtEBxXO2GP6BHngMr',
'X-Parse-REST-API-Key':'sTXzJDJtFGxUxqKVKKYvBTBqEnLIzfmzATH2sW22'});

   responseData = LocationData.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map<String,dynamic>);
  debugPrint('response is : ${jsonEncode(responseData)}');
  return responseData;
  //print(await client.get(uri));
} finally {
  client.close();
}
} 
}
 