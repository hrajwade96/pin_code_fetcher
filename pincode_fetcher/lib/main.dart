import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

//import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


void main() async {

  var client = http.Client();
try {
      Map<String, String> queryParams = {
    "where": jsonEncode({
      "adminName1": "Maharashtra",
      "adminName2": "Mumbai"
    })
  };
  var uri = Uri.parse('https://parseapi.back4app.com/classes/Dataset_India_Pin_Code').replace(queryParameters:queryParams );

  var response = await client.get(
      uri, headers: {'X-Parse-Application-Id':'qfhJwZKbzkmj4Bp87kdizGQCtEBxXO2GP6BHngMr',
'X-Parse-REST-API-Key':'sTXzJDJtFGxUxqKVKKYvBTBqEnLIzfmzATH2sW22'});
//   var response = await client.get(
//       Uri.parse('https://parseapi.backpop4app.com/classes/Dataset_India_Pin_Code'+'where=$locationMap'), headers: {'X-Parse-Application-Id':'qfhJwZKbzkmj4Bp87kdizGQCtEBxXO2GP6BHngMr',
// 'X-Parse-REST-API-Key':'sTXzJDJtFGxUxqKVKKYvBTBqEnLIzfmzATH2sW22' });

  var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //var uri = Uri.parse(decodedResponse['uri'].toString());
  debugPrint(' response is : ${jsonEncode(decodedResponse)}');
  //print(await client.get(uri));
} finally {
  client.close();
}
  // WidgetsFlutterBinding.ensureInitialized();
  // const keyApplicationId = 'qfhJwZKbzkmj4Bp87kdizGQCtEBxXO2GP6BHngMr';
  // const keyClientKey = 'SQgDijC4Se1Ush4ffqwQ1PGaKNOgN4RT0sWrvQrq';
  // const keyParseServerUrl = 'https://parseapi.back4app.com';

  // await Parse().initialize(keyApplicationId, keyParseServerUrl,
  //     clientKey: keyClientKey, debug: true);

  // var firstObject = ParseObject('FirstClass')
  //   ..set(
  //       'message', 'Hey ! First message from Flutter. Parse is now connected');
  // await firstObject.save();
  
  // debugPrint('done');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          // bodyText2: TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // This controller will store the value of the search bar
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pincode Fetcher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          //  GenerateAddressOutput(dataList:  []),
          ],
        ),
      ),
  
    );
  }
} 

