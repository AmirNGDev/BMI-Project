import 'dart:async';
import 'package:bmi/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(31, 28, 55, 1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromRGBO(31, 28, 55, 1),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const HomeScreen());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 28, 55, 1),
      body: Container(
        child: const Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'bmi',
                      style: TextStyle(
                          fontFamily: 'Splashfont',
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 120, 220, 100)),
                    ),
                    Text(
                      'CALCULATOR',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(28, 84, 150, 100)),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
              Text(
                'VERSION 1.1.4',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
