import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/main/main_page.dart';
import '../presentation/pages/object_scheme/object_scheme_page.dart';
import '../presentation/pages/objects_list/objects_list_page.dart';

class AppRouter {
  AppRouter() {
    router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return MainPage(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const ObjectsListPage(),
            ),
            GoRoute(
              path: '/sets',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const ObjectsListPage(),
            ),
            GoRoute(
              path: '/profile',
              parentNavigatorKey: _shellNavigatorKey,
              builder: (context, state) => const ObjectsListPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/object',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const ObjectSchemePage(),
        ),
      ],
    );
  }

  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _shellNavigatorKey = GlobalKey<NavigatorState>();
  late final GoRouter router;
}
