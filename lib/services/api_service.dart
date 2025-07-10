import 'package:http/http.dart' as http;
import '../models/user_model.dart'; // Ensure this path is correct

class ApiService {
  static const String _usersUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(_usersUrl));

      if (response.statusCode == 200) {
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        throw Exception('Failed to load users (Status code: ${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}