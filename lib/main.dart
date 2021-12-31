import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/views/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  overrideNavColors();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}
