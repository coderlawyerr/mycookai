import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String userId;
  final String name;
  final String email;


  UserModel({
    required this.userId,
    required this.name,
    required this.email,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        userId: user.uid,
        name: user.displayName ?? '',
        email: user.email!);
  }

  Map<String,dynamic> toMap(){
    return {
      'user_id':userId,
      'name':name,
      'email':email,
    };
  }

 factory UserModel.fromMap(Map<String,dynamic> map){
  return UserModel(
    userId: map['user_id'],
    name:map['name'],
    email:map['email']);
 }
}
