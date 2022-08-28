import 'dart:convert';

import 'package:http/http.dart';
import 'package:online_bloc/model/post_model.dart';


class Network {
  static String BASE = "63086d7346372013f57ceb63.mockapi.io";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_LIST = "api/students";
  static String API_CREATE = "api/students";
  static String API_UPDATE = "api/students/"; //{id}
  static String API_DELETE = "api/students/"; //{id}

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Student student) {
    Map<String, String> params = {};
    params.addAll({
      'name': student.name,
      'sureName': student.sureName,
      'number': student.number,

    });
    return params;
  }

  static Map<String, String> paramsUpdate(Student student) {
    Map<String, String> params = {};
    params.addAll({
      'id': student.id!,
      'name': student.name,
      'sureName': student.sureName,
      'number': student.number,
    });
    return params;
  }

  static List<Student> parseMockList(String str) {
    List json = jsonDecode(str);
    List<Student> list = json.map((e) => Student.fromJson(e)).toList();
    return list;
  }
}