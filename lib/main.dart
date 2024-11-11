import 'package:flutter/material.dart';
import 'package:news/app.dart';
import 'package:news/src/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(App());
}
