// ignore: file_names
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

// var apiKey = '';
// var date = '';
var headers = {
  // 'x-access-token': apiKey,
  'Content-Type': 'application/json'
};

api(data) async {
  var url = Uri.https('medicales.vercel.app', '/api');
  var response = await http.post(url, headers: headers, body: data);
  var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

  return jsonResponse;
}
