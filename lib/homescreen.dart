import 'dart:math';
import 'package:bmi/calculating.dart';
import 'package:bmi/resultscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color aColor = Colors.grey;
  Color bColor = Colors.grey;
  Color cColor = const Color.fromRGBO(206, 212, 218, 1);
  double s1 = 50;
  double s2 = 50;
  double sliderValue = 120;
  int WeightValue = 40;
  int AgeValue = 18;
  int isMale = 0;
  Color PraimColor = const Color.fromRGBO(1, 1, 88, 1);
  Color BackColor = const Color.fromRGBO(0, 1, 64, 1);

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            height: 140,
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: PraimColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    padding: const EdgeInsets.all(3),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          bColor = Colors.grey;
                          aColor = cColor;
                          s1 = 60;
                          s2 = 50;
                          isMale = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.mars,
                            size: s1,
                            color: aColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                              color: aColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: PraimColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                    padding: const EdgeInsets.all(3),
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          aColor = Colors.grey;
                          bColor = cColor;
                          s2 = 60;
                          s1 = 50;
                          isMale = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            size: s2,
                            color: bColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              color: bColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 170,
              decoration: BoxDecoration(
                color: PraimColor,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HEIGHT :',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                sliderValue.toInt().toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Splashfont',
                                  fontSize: 37,
                                ),
                              ),
                              const Text(
                                'CM',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          CupertinoSlider(
                            value: sliderValue,
                            divisions: 90,
                            min: 120,
                            max: 210,
                            activeColor: cColor,
                            thumbColor: cColor,
                            onChanged: (c) {
                              setState(() {
                                sliderValue = c;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
          Container(
            height: 200,
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                      decoration: BoxDecoration(
                        color: PraimColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT(KG)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            WeightValue.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Splashfont',
                              fontSize: 38,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    if (WeightValue > 40) {
                                      WeightValue -= 10;
                                    } else {
                                      WeightValue = 30;
                                    }
                                  });
                                },
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (WeightValue > 30) {
                                        WeightValue--;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                  foregroundColor: Colors.black,
                                  backgroundColor: cColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    if (WeightValue < 110) {
                                      WeightValue += 10;
                                    } else {
                                      WeightValue = 120;
                                    }
                                  });
                                },
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (WeightValue < 120) {
                                        WeightValue++;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                  foregroundColor: Colors.black,
                                  backgroundColor: cColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                      decoration: BoxDecoration(
                        color: PraimColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      margin: const EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            AgeValue.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Splashfont',
                              fontSize: 38,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    if (AgeValue > 20) {
                                      AgeValue -= 10;
                                    } else {
                                      AgeValue = 10;
                                    }
                                  });
                                },
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (AgeValue > 10) {
                                        AgeValue--;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.remove),
                                  foregroundColor: Colors.black,
                                  backgroundColor: cColor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    if (AgeValue < 38) {
                                      AgeValue += 10;
                                    } else {
                                      AgeValue = 48;
                                    }
                                  });
                                },
                                child: FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (AgeValue < 48) {
                                        AgeValue++;
                                      }
                                    });
                                  },
                                  child: const Icon(Icons.add),
                                  foregroundColor: Colors.black,
                                  backgroundColor: cColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (isMale == 0) {
                showSnackBar(context, "You haven't chosen your gender yet !");
              } else {
                double result = 0.0;
                result = WeightValue / pow(sliderValue / 100, 2);
                Get.to(
                  Calculating(
                    result,
                    isMale,
                    sliderValue,
                    WeightValue,
                    AgeValue,
                  ),
                );
              }
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(19.0)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.2, 0.4, 0.6, 0.8, 1.0],
                  colors: [
                    Color.fromRGBO(255, 113, 200, 1),
                    Color.fromARGB(255, 90, 24, 196),
                    Color.fromRGBO(252, 11, 123, 1),
                    Color.fromARGB(255, 245, 85, 10),
                    Color.fromARGB(255, 228, 195, 9),
                    Color.fromARGB(255, 240, 225, 12),
                  ],
                ),
              ),
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(23),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String textvalue) {
    final text = textvalue;
    final snackBar = SnackBar(
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 3),
      content: Row(
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(text),
          )
        ],
      ),
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
