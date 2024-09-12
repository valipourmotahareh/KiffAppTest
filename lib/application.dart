import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kiff_app_test/config/style/kiff_app_theme.dart';
import 'package:kiff_app_test/core/dependency_injection/locator.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: locator.get<GoRouter>(),
      theme: KiffAppTheme.darkTheme,
    );
  }
}
