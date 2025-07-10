import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class ApiService {
  static const String _usersUrl = 'https://jsonplaceholder.typicode.com/users' ;
  Future<List<User>> fetchUsers() async{
    try{
      final response = await http.get(Uri.parse(_usersUrl));

      if (response.statusCode == 200){
        final users =  User.fromJson(response.body as Map<String, dynamic>) as List<User>;
        return users;
      } else{
        throw Exception('Failed to load users (Status code : ${response.statusCode})');
      }
    } catch (e){
      throw Exception('failed to fetch users: $e');
    }
  }
}