import 'package:flutter/material.dart';
import 'package:just_join/views/splash/components/body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
