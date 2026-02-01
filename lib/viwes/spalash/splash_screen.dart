import 'dart:async';

import 'package:e_commerce_food/manger/mager_image.dart';
import 'package:e_commerce_food/viwes/onbording/onbording_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  int _secondsRemaining = 3;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => OnbordingScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(ManagerImage.logo)));
  }
}
