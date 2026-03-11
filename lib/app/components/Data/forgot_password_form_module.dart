import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ForgotPasswordFormModel {
  final GlobalKey<FormBuilderState> formKey =
  GlobalKey<FormBuilderState>();
  static const String email = 'email';
  late Map<String, dynamic> initialValue;

  ForgotPasswordFormModel()
      : initialValue = {
    email: kDebugMode ? 'alikhattak2345@gmail.com' : '',
  };

  bool saveAndValidate() {
    return formKey.currentState?.saveAndValidate() ?? false;
  }

  Map<String, dynamic> get payload {
    return formKey.currentState!.value;
  }
}