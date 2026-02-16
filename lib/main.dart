import 'package:flutter/material.dart';
import 'package:test5/screens/home_screen.dart';
import 'package:test5/screens/Regitration.dart';
//import 'package:flex_color_scheme/flex_color_scheme.dart';
//import 'package:untitled/Theme/app.dart';
import 'package:test5/screens/login.dart';
import 'package:test5/theme.dart';
//import 'package:test5/app/components/form_input_feilds/form_input_feilds.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      //darkTheme: AppTheme.dark,
      //themeMode: ThemeMode.system,
      //home: LoginScreen(),
      //home: RegitrationScreen(),
      home: const HomeScreen(),
    );
  }
}
