import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatelessWidget {
  double result;
  int gender;
  double height;
  int weight;
  int age;

  ResultScreen(this.result, this.gender, this.height, this.weight, this.age,
      {super.key});

  Color PraimColor = const Color.fromRGBO(1, 1, 88, 1);

  Color BackColor = const Color.fromRGBO(0, 1, 64, 1);

  Color fontColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    String titleText = '';
    String resultsub = '';
    String bodyText = '';
    String genderChar = '';
    String heightValue = '';

    if (result >= 25) {
      titleText = 'Overweight';
      fontColor = Colors.red;
      bodyText =
          'You have a higher than normal body weight.\nTry to exercise more.';
    } else if (result > 18.5) {
      titleText = 'Normal';
      fontColor = Colors.green;
      bodyText = 'You have a normal body weight.\nGood job !';
    } else {
      titleText = 'Underweight';
      fontColor = Colors.blue;
      bodyText =
          'You have a lower than normal body weight.\nYou can eat a bit more.';
    }

    if (gender == 1) {
      genderChar = 'Male';
      heightValue = height.toString().substring(0, 3);
      resultsub = result.toString().substring(0, 4);
    } else {
      genderChar = 'Female';
      heightValue = height.toString().substring(0, 3);
      resultsub = result.toString().substring(0, 4);
    }
    String textCopy =
        'BMI : $resultsub\nResult : $titleText\nGender : $genderChar\nHeight : $heightValue\nWeight : $weight\nAge : $age';
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
          const Center(
            child: Text(
              'Your Result',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Splashfont',
                fontSize: 65,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: PraimColor,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            margin: const EdgeInsets.fromLTRB(16, 5, 16, 16),
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      titleText,
                      style: TextStyle(
                        color: fontColor,
                        fontFamily: 'Splashfont',
                        fontSize: 44,
                      ),
                    ),
                    Text(
                      result.toString().substring(0, 4),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Splashfont',
                        fontSize: 118,
                      ),
                    ),
                    Text(
                      bodyText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: PraimColor,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textCopy,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: textCopy),
                        );
                      },
                      child: Icon(Icons.copy),
                      foregroundColor: Colors.white,
                      backgroundColor: BackColor,
                    ),
                    FloatingActionButton.small(
                      onPressed: () {
                        Share.share(
                          textCopy,
                          subject: 'My BMI',
                        );
                      },
                      child: Icon(Icons.share),
                      foregroundColor: Colors.white,
                      backgroundColor: BackColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
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
            //padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: PraimColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                      ),
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: PraimColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: const Center(
                            child: Text(
                              'RE-CALCULATE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
