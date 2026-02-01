import 'package:e_commerce_food/manger/manger_name.dart';
import 'package:e_commerce_food/services_ads_storage_local/preference_manager.dart';
import 'package:e_commerce_food/viwes/home/home_screen.dart';
import 'package:e_commerce_food/viwes/spalash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final _name = PreferenceManager().getString(MangerName.firstName);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _name == null ? SplashScreen() : HomeScreen(),
    );
  }
}
