import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PersonalInfoFormModel {
  final GlobalKey<FormBuilderState> formKey =
  GlobalKey<FormBuilderState>();

  static const String name = 'Name';
  static const String username = 'Username';
  static const String Phone_no = 'Phone no';
  static const String city = 'City';

  late Map<String, dynamic> initialValue;

  PersonalInfoFormModel()
      : initialValue = {
    name: kDebugMode ? 'Muhammad Saif':'',
    Phone_no: kDebugMode ? '12345678' : '',
    city:kDebugMode ? 'Dubai':'',
    username : kDebugMode ? 'saif1234':'',
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