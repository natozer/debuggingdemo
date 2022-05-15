import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:list_view/constants/constants.dart';
import 'package:list_view/models/user_model.dart';

class ApiService {
  Future<List<User>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<User> _model = userFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
