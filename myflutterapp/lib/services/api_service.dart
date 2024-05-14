import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
    final String baseUrl = "http://10.0.2.2:8000"; // Use localhost IP for Android emulator

    Future<List<dynamic>> getContacts() async {
        try {
            final response = await http.get(Uri.parse('$baseUrl/contacts/'));
            if (response.statusCode == 200) {
                return json.decode(response.body);
            } else {
                throw Exception('Failed to load contacts');
            }
        } catch (e) {
            throw Exception('Failed to connect to the API: $e');
        }
    }
}
