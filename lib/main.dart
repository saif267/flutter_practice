import 'package:flutter/material.dart';
import 'package:test5/theme.dart';
import 'app/network/secure_token_storage.dart';
import 'app/router/app_navigator.dart';
import 'app/router/app_router.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   
  final token = await SecureTokenStorage.getAccessToken();

  if (token != null) {
    AppNavigator().initialRoute = "/home";
  } else {
    AppNavigator().initialRoute = "/login";
  }
   AppNavigator().setRouter(AppRouter.router);
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigator().router,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}