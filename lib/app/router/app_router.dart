import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../screens/login.dart';
import '../../../screens/registration.dart';
import '../../../screens/forgot_password.dart';
import '../../../screens/home_screen.dart';
import '../../../screens/main_shell_screen.dart';
import '../../Dummyscreens/History.dart';
import '../../Dummyscreens/Matches.dart';
import '../../Dummyscreens/Play.dart';
import '../../Dummyscreens/Profile.dart';
import 'app_navigator.dart';

class AppRouter {

  static final _homeNavigatorKey = GlobalKey<NavigatorState>();
  static final _matchesNavigatorKey = GlobalKey<NavigatorState>();
  static final _playNavigatorKey = GlobalKey<NavigatorState>();
  static final _historyNavigatorKey = GlobalKey<NavigatorState>();
  static final _profileNavigatorKey = GlobalKey<NavigatorState>();

  static final routerObserverProvider = RouteObserver<ModalRoute<void>>();


   static final GoRouter  router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: AppNavigator().initialRoute,
      observers: [routerObserverProvider],

      routes: [

        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              name: 'forgot',
              path: 'forgot',
              builder: (context, state) => ForgotPasswordScreen(),
            ),
          ],
        ),

        GoRoute(
          name: 'register',
          path: '/register',
          builder: (context, state) => registrationScreen(),
        ),

        StatefulShellRoute.indexedStack(

          builder: (context, state, navigationShell) {
            return MainShellScreen(navigationShell: navigationShell);
          },

          branches: [

            StatefulShellBranch(
              navigatorKey: _homeNavigatorKey,
              routes: [
                GoRoute(
                  name: 'home',
                  path: '/home',
                  builder: (context, state) => const HomeScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              navigatorKey: _matchesNavigatorKey,
              routes: [
                GoRoute(
                  name: 'matches',
                  path: '/matches',
                  builder: (context, state) => const MatchesScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              navigatorKey: _playNavigatorKey,
              routes: [
                GoRoute(
                  name: 'play',
                  path: '/play',
                  builder: (context, state) => const PlayScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              navigatorKey: _historyNavigatorKey,
              routes: [
                GoRoute(
                  name: 'history',
                  path: '/history',
                  builder: (context, state) => const HistoryScreen(),
                ),
              ],
            ),

            StatefulShellBranch(
              navigatorKey: _profileNavigatorKey,
              routes: [
                GoRoute(
                  name: 'profile',
                  path: '/profile',
                  builder: (context,state) => const ProfileScreen(),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }