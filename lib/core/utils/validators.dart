import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/extensions/context_extensions.dart';

class Validators {
  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.local.emailRequired;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return context.local.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.local.passwordRequired;
    }
    if (value.length < 8) {
      return context.local.passwordTooShort;
    }
    
    // Check for "strong" criteria: uppercase, lowercase, number, special char
    final hasUppercase = value.contains(RegExp(r'[A-Z]'));
    final hasLowercase = value.contains(RegExp(r'[a-z]'));
    final hasDigits = value.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasLowercase || !hasDigits || !hasSpecialCharacters) {
      return context.local.passwordWeak;
    }
    
    return null;
  }

  static String? validateRequired(BuildContext context, String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName ${context.local.isRequired}';
    }
    return null;
  }
}
