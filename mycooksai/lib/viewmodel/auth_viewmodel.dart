import 'package:flutter/material.dart';
import 'package:mycooksai/model/user_model.dart';
import 'package:mycooksai/service/auth_service.dart';
import 'package:mycooksai/service/database_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();

  UserModel? _user;
  UserModel? get user => _user;

  AuthViewModel() {
    _initializeUser();
  }

  Future<void> _initializeUser() async{
    _user = await _authService.getCurrentUser();
    if(_user != null){
      _user = await _databaseService.getUser(_user!.userId);
    }
    notifyListeners();
  }

  Future<void> registerWithEmail(
      String email, String password, String name) async {
    await _authService.registerWithEmail(email, password, name);
    _user = await _authService.getCurrentUser();
    if (_user != null){
      _user = await _databaseService.getUser(_user!.userId);
    }
    notifyListeners();
  }

  Future<void> loginWithEmail(String email, String password) async {
    await _authService.loginWithEmail(email, password);
    _user = await _authService.getCurrentUser();
    notifyListeners();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authService.sendPasswordResetEmail(email);
  }

  Future<void> signOut()async{
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
