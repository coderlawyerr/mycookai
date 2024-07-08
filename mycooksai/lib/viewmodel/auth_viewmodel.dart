import 'package:flutter/material.dart';
import 'package:mycooksai/model/user_model.dart';
import 'package:mycooksai/service/auth_service.dart';

class AuthViewMoel extends ChangeNotifier{
  final AuthService _authService = AuthService();

  UserModel? _user;
  UserModel? get user => _user;

  AuthViewMoel(){

  }

  Future<void> registerWithEmail(String email,String password,String name)async {
    await _authService.registerWithEmail(email,password,name);
    _user = await _authService.getCurrentUser();
    notifyListeners();
  }

 Future<void> loginWithEmail(String email,String password)async {
  await _authService.loginWithEmail(email,password);
  _user = await _authService.getCurrentUser();
  notifyListeners();
 }
}