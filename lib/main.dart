import 'package:flutter/material.dart';
import 'package:flutter_story_dicoding_intermediate/di/injections.dart';
import 'package:shared_navigation/config/navigation_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injections().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: NavigationConfig().navigation,
    );
  }
}
