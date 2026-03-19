import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  AppNavigator._();
  static final _instance = AppNavigator._();
  factory AppNavigator() => _instance;
  String initialRoute = "/login";
  late GoRouter router;
  void setRouter(GoRouter routerInstance) {
    router = routerInstance;
  }

  BuildContext get context => router.routerDelegate.navigatorKey.currentContext!;

  void navigateTo(
      String route, {
        Map<String, String> params = const {},
        Map<String, String> queryParams = const {},
        Object? extra,
      }) {
    context.goNamed(
      route,
      pathParameters: params,
      queryParameters: queryParams,
      extra: extra,
    );
  }

  bool canPop() {
    return context.canPop();
  }

  void pop() {
    context.pop();
  }

  void navigateToLoginScreen() {
    navigateTo("login");
  }

  void navigateToRegisterScreen() {
    navigateTo("register");
  }

  void navigateToForgotPasswordScreen() {
    navigateTo("forgot");
  }

  void navigateToHomeScreen() {
    navigateTo("home");
  }
  void navigateToMatches() {
    navigateTo("matches");
  }

  void navigateToPlay() {
    navigateTo("play");
  }

  void navigateToHistory() {
    navigateTo("history");
  }

  void navigateToProfile() {
    navigateTo("profile");
  }
}