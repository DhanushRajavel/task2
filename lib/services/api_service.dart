import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task2/model/user.dart';

class ApiService {
  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=5000'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
