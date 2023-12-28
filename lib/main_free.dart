import 'package:flutter/material.dart';
import 'package:flutter_story_dicoding_intermediate/di/injections.dart';
import 'package:flutter_story_dicoding_intermediate/main.dart';
import 'package:shared_common/flavor/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavorType: FlavorType.free,
  );
  await Injections().initialize();
  runApp(const MyApp());
}
