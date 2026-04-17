import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_users/user_model.dart';

class UserListService {
  Future<List<UserModel>> fetchUser() async {
    final uri = Uri.https('jsonplaceholder.typicode.com', '/users');

    final response = await http.get(
      uri,
      headers: {
        'Accept': '*/*',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      print(uri);
      print('Status Code: ${response.statusCode}');
      throw Exception('Failed to obtain random user data');
    }
  }
}
