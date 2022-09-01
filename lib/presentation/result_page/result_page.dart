import 'package:flutter/material.dart';
import '../shared/constants.dart';
import '../shared/widgets/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.bmiValue,
    required this.bmiInterpretationString,
    required this.bmiRangeString,
    required this.weightColor,
    required this.bmiFeedback,
  }) : super(key: key);

  final double bmiValue;
  final String bmiInterpretationString;
  final String bmiRangeString;
  final Color weightColor;
  final String bmiFeedback;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Result',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.63,
                  decoration: BoxDecoration(
                    color: inAktiveColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmiInterpretationString.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: weightColor,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          bmiValue.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          '$bmiInterpretationString BMI range:',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          bmiRangeString,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          bmiFeedback,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE BMI',
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
