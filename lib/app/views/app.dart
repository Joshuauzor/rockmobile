import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rockapp/app/styles/colors.dart';
import 'package:rockapp/core/navigators/router.dart';
import 'package:rockapp/core/navigators/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RockApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.background,
        primarySwatch: const MaterialColor(
          0xff101D70,
          AppColors.colorScratch,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.splashView,
      onGenerateRoute: generateRoute,
    );
  }
}

void overrideNavColors() {
  // if (Platform.isAndroid) {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    /// Set StatusBar Customization.
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,

    /// Set NavigationBar Customization.
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  //}
}
