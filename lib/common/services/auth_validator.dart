import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String passwordValidator(String? value) {
  if (value != null) {
    if (value.length >= 8) {
      return 'Password cannot be less than 8';
    }
  }
  return 'Password cannot be empty';
}

String emailValidator(String? value) {
  if (value != null) {
    if (!value.contains('@')) {
      return 'Incorrect email format';
    }
  }
  return 'Email cannot be empty';
}

void verifyForm({GlobalKey<FormState>? formKey}) {
  if (formKey != null) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    formKey.currentState!.save();
    print(isValid);
  }
}
