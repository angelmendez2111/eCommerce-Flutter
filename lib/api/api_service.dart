import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8080/api/auth"; // Para emulador Android

  Future<bool> registerUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return true; // Registro exitoso
      } else {
        print("Error en registro: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error en la solicitud: $e");
      return false;
    }
  }
}
