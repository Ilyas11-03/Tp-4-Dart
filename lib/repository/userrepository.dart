import 'dart:convert';

import 'package:enset_app2/model/users.model.dart';
import 'package:http/http.dart' as http;

class Userrepository {
  Future<ListUsers> searchUsers(String keyword, int page, int pageSize) async {
    String url =
        "https://api.github.com/search/users?q=$keyword&page=$page&per_page=$pageSize";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> listUsersMap = json.decode(response.body);
        ListUsers listUsers = ListUsers.fromJson(listUsersMap);
        return listUsers;
      } else {
        throw ("Error 404 Not Found!! ${response.statusCode}");
      }
    } catch (exc) {
      throw ("Error=>" + exc.toString());
    }
  }
}
