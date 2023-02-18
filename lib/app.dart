import 'package:flutter/material.dart';
import 'package:just_join/config/routes.dart';
import 'package:just_join/views/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routeName,
      routes: routes,
    );
  }
}
