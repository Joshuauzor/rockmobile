import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rockapp/locator.dart';
import 'app/views/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupsl();
  await dotenv.load();
  overrideNavColors();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
