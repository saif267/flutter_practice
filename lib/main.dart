import 'package:flutter/material.dart';
import 'package:test5/theme.dart';
import 'app/router/app_navigator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppNavigator().router.routerDelegate,
      routeInformationParser: AppNavigator().router.routeInformationParser,
      routeInformationProvider: AppNavigator().router.routeInformationProvider,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}