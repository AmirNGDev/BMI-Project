import 'dart:async';
import 'package:bmi/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Calculating extends StatelessWidget {
  double result;
  int gender;
  double height;
  int weight;
  int age;

  Calculating(this.result, this.gender, this.height, this.weight, this.age,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Color BackColor = const Color.fromRGBO(0, 1, 64, 1);

    Timer(const Duration(seconds: 2), () => go());

    return Scaffold(
      backgroundColor: BackColor,
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Splashfont',
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: BackColor,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitThreeBounce(
              color: Colors.white,
              size: 30.0,
            ),
            Text(
              'Calculating your BMI...',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void go() {
    Get.off(ResultScreen(result, gender, height, weight, age));
  }
}
