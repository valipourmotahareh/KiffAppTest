import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiff_app_test/config/kiff_router/routes.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/show_list.dart';
import 'package:kiff_app_test/features/feature_kiff_app/presentation/screens/show_list_two.dart';
import 'package:kiff_app_test/features/main/presentation/screens/home_page.dart';

class KiffRouter {
  late GoRouter router = GoRouter(
    debugLogDiagnostics: false,
    initialLocation: Routes.homePage,
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      restorationId: state.pageKey.value,
      child: Container(),
    ),
    routes: <GoRoute>[
      _route(
        name: Routes.homePage,
        path: Routes.homePage,
        pageBuilder: (state) => const HomePage(),
      ),
      _route(
        name: Routes.showList,
        path: Routes.showList,
        pageBuilder: (state) => const ShowList(),
        routes: [
          _route(
            name: Routes.showListTwo,
            path: 'show_list_two',
            pageBuilder: (state) => const ShowListTwo(),
          ),
        ],
      ),
    ],
  );

  GoRoute _route({
    required String name,
    required String path,
    required Widget Function(GoRouterState state) pageBuilder,
    List<GoRoute> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: name,
        routes: routes,
        pageBuilder: (context, state) => CustomTransitionPage(
          child: pageBuilder(state),
          key: state.pageKey,
          restorationId: state.pageKey.value,
          transitionDuration: const Duration(milliseconds: 350),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
}
