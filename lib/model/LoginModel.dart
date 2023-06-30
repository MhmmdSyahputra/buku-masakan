import 'package:flutter/material.dart';

class UserLoginModel {
  final String id;
  final String username;
  final String email;
  final String password;
  late List mySave;

  UserLoginModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.mySave});
}
