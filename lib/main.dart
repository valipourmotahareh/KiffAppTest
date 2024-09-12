import 'package:flutter/material.dart';
import 'package:kiff_app_test/application.dart';
import 'package:kiff_app_test/core/dependency_injection/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const Application());
}
