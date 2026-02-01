import 'package:e_commerce_food/services_ads_storage_local/preference_manager.dart';
import 'package:e_commerce_food/viwes/spalash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  PreferenceManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
