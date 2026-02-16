import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginForm{
  final GlobalKey<FormBuilderState>formkey = GlobalKey<FormBuilderState>();
  //static const String email = 'email';
  static const String password = 'password';
  static const String emailOrPhone = 'email_or_phone';
  static const String fullName = 'full_name';
  Map<String, dynamic>initialvalue;
  LoginForm()
      : initialvalue = {
    //email:kDebugMode ? 'alikhattak2345@gmail.com':"",
    password: kDebugMode ?'12345678':"",
    fullName: kDebugMode ? 'Ali Khattak' : "",
    emailOrPhone: kDebugMode ?'1234567890':""


  };
  bool validate(){
    return formkey.currentState?.validate()?? false;
  }
  void save(){
    formkey.currentState?.save();
  }

  bool saveAndValidate() {
    return formkey.currentState?.saveAndValidate() ?? false;
  }

  /// GET FINAL PAYLOAD
  Map<String, dynamic> get payload {
    return formkey.currentState!.value;
  }
}
