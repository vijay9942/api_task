
import 'dart:convert';

import 'api_model.dart';
import 'package:http/http.dart' as http;

class ApiServer{
  static Future<List<Assignment >> fetchLessons ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if(response.statusCode == 200){
      List<dynamic>jsonResponse = jsonDecode(response.body);
      print('${response.body}');
      return jsonResponse.map((json) => Assignment.fromjson(json))  .toList();
    }else{
      throw Exception('failed to reload');
    }
  }
}