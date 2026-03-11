import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegistrationFormModel {
  final GlobalKey<FormBuilderState> formKey =
  GlobalKey<FormBuilderState>();

  static const String username = 'username';
  static const String email = 'email';
  static const String phone = 'phone';
  static const String password = 'password';

  late Map<String, dynamic> initialValue;

  RegistrationFormModel()
      : initialValue = {
    username: kDebugMode ? 'Ali Khattak' : '',
    email: kDebugMode ? 'alikhattak2345@gmail.com' : '',
    phone: kDebugMode ? '1234567890' : '',
    password: kDebugMode ? '12345678' : '',
  };

  bool saveAndValidate() {
    return formKey.currentState?.saveAndValidate() ?? false;
  }

  Map<String, dynamic> get payload {
    return formKey.currentState!.value;
  }
}