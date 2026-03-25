import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginFormModel {
  final GlobalKey<FormBuilderState> formKey =
  GlobalKey<FormBuilderState>();

  static const String email = 'Email';
  static const String password = 'password';

  late Map<String, dynamic> initialValue;

  LoginFormModel()
      : initialValue = {
    email: kDebugMode ? 'saif123@gmail.com': '',
    password: kDebugMode ? '12345678' : '',
  };

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  void save() {
    formKey.currentState?.save();
  }

  bool saveAndValidate() {
    return formKey.currentState?.saveAndValidate() ?? false;
  }

  Map<String, dynamic> get payload {
    return formKey.currentState!.value;
  }
}