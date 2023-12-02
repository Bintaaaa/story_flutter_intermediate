import 'package:flutter/material.dart';
import 'package:flutter_story_dicoding_intermediate/di/injections.dart';
import 'package:shared_libraries/go_router/go_router.dart';
import 'package:shared_navigation/config/navigation_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter? _config;

  @override
  void initState() {
    super.initState();
    _config = NavigationConfig().navigation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _config!.routeInformationParser,
      routeInformationProvider: _config!.routeInformationProvider,
      routerDelegate: _config!.routerDelegate,
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
