import 'dart:convert';

import 'package:http/http.dart';

class NetworkCaller{
  Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      final Response response = await post(
        Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-Type': 'Application/json'
      },
      );
      if(response.statusCode == 200){
        return NetworkResponse(
          isSuccess: true,
          statusCode: 200,
          jsonData: jsonDecode(response.body),
        );
      } else{
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, jsonData: jsonDecode(response.body));
      }
    } catch (e){
      return NetworkResponse(isSuccess: false, eroMessage: e.toString());

    }
  }
}
 class NetworkResponse{
  final int? statusCode;
  final bool isSuccess;
  final String? eroMessage;
  final dynamic? jsonData;

  NetworkResponse({
    this.statusCode = -1,
    required this.isSuccess,
    this.eroMessage = 'some is wrong',
    this.jsonData
  });
}