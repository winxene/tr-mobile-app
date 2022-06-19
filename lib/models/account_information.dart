import 'package:flutter/material.dart';

class AccountInformation {
  final String username;
  final String email;
  final String password;
  final String passwordConfirmation;

  AccountInformation({
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}
