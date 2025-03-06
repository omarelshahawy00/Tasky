import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppRegex {
  final BuildContext context;
  final String? confirmationPassword;
  AppRegex({required this.context, this.confirmationPassword});
  static bool isEmailValid(String email) {
    return RegExp(
      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
    ).hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    ).hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required";
    }

    if (!hasLowerCase(password)) {
      return "Password must include at least one lowercase letter";
    }

    if (!hasUpperCase(password)) {
      return "Password must include at least one uppercase letter";
    }

    if (!hasNumber(password)) {
      return "Password must include at least one number";
    }

    if (!hasSpecialCharacter(password)) {
      return "Password must include at least one special character";
    }

    if (!hasMinLength(password)) {
      return "Password must be at least 8 characters long";
    }

    return null; // Valid password
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "emptyName";
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "phoneNumberIsRequired";
    }
    return null;
  }
}
