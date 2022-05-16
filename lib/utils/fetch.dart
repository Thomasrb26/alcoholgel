import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class Fetch {
  
  static String baseUrl =  'alcoholgel-app-utal-default-rtdb.firebaseio.com';

  static void httpPost(Object body, endpoint){

    http.post(
      Uri.https(
        baseUrl,endpoint
      ),
      body: json.encode(body)
    );
  }

  static Future<Response> httpGet(endpoint) async {
    final response = await http.get(
      Uri.https(baseUrl, endpoint)
    );
    return response;
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach( (id, data) {
      print(data);
    });
  }

}