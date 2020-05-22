import 'dart:io';

import 'package:http/http.dart' as http;

class ApiProvider {
  final String _baseUrl = '';

  Future<dynamic> get(String url) async {
    var responseJson;

    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }

    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String message]) : super(message, "Error During Communication: ");
}
