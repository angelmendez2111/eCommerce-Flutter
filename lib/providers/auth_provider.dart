import 'package:flutter/material.dart';
import '../api/api_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Future<bool> register(String email, String password) async {
    bool success = await _apiService.registerUser(email, password);
    notifyListeners();
    return success;
  }

  Future<bool> confirmEmail(String email, String code) async {
    bool success = await _apiService.confirmEmail(email, code);
    notifyListeners();
    return success;
  }
}
