import 'dart:async';
import 'package:bmicalculator/business/bmi_business_logic.dart';
import 'package:bmicalculator/presentation/input_page/widgets/missing_input_dialog.dart';
import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:bmicalculator/presentation/result_page/result_page.dart';
import 'package:bmicalculator/presentation/shared/widgets/bottom_button.dart';
import 'package:bmicalculator/presentation/input_page/widgets/gender_input.dart';
import 'package:bmicalculator/presentation/input_page/widgets/height_input.dart';
import 'package:bmicalculator/presentation/input_page/widgets/weight_age_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var _isMale = false;
  var _height = 0;
  var _weight = 0;
  var _age = 0;
  Timer? _timer;

  void increaseByType(String type) {
    setState(() {
      type.startsWith('w') ? _weight++ : _age++;
    });
  }

  void decreaseByType(String type) {
    setState(() {
      if (type.startsWith('w') && _weight > 0) {
        _weight--;
      } else if (!type.startsWith('w') && _age > 0) {
        _age--;
      }
    });
  }

  void _decisionFunction() {
    if (_weight > 0 && _height > 0 && _age > 0) {
      final calc = BmiBusinessLogic(
        weight: _weight,
        age: _age,
        height: _height,
        isMale: _isMale,
      );
      final bmiInformation = calc.getBmiInformation();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            bmiValue: bmiInformation['bmiValue'],
            bmiInterpretationString: bmiInformation['bmiInterpretationString'],
            bmiRangeString: bmiInformation['bmiRangeString'],
            weightColor: bmiInformation['weightColor'],
            bmiFeedback: bmiInformation['bmiFeedback'],
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => const MissingInputDialog(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GenderInputWidget(
                      backgroundColor: _isMale ? aktiveColor : inAktiveColor,
                      foreGroundColor: Colors.white,
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                      onPressed: () => setState(() {
                        _isMale = true;
                      }),
                    ),
                    GenderInputWidget(
                      backgroundColor: !_isMale ? aktiveColor : inAktiveColor,
                      foreGroundColor: Colors.white,
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                      onPressed: () => setState(() {
                        _isMale = false;
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                HeightInputWidget(
                  heightInputValue: _height,
                  slider: Slider(
                    value: _height.toDouble(),
                    activeColor: aktiveColor,
                    inactiveColor: Colors.grey,
                    thumbColor: aktiveColor,
                    min: 0,
                    max: 230,
                    onChanged: (value) => setState(() {
                      _height = value.round();
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeightOrAgeInputWidget(
                      label: 'WEIGHT',
                      value: _weight,
                      onLongPressPlus: () {
                        Future.delayed(const Duration(milliseconds: 10), () {
                          _timer = Timer.periodic(
                              const Duration(milliseconds: 120), (timer) {
                            increaseByType('w');
                          });
                        });
                      },
                      onLongPressMinus: () {
                        Future.delayed(const Duration(milliseconds: 10), () {
                          _timer = Timer.periodic(
                            const Duration(milliseconds: 120),
                            (timer) {
                              decreaseByType('w');
                            },
                          );
                        });
                      },
                      onPressPlus: () => increaseByType('w'),
                      onPressMinus: () => decreaseByType('w'),
                      onLongPressEnd: () => _timer?.cancel(),
                    ),
                    WeightOrAgeInputWidget(
                      label: 'AGE',
                      value: _age,
                      onLongPressPlus: () {
                        Future.delayed(const Duration(milliseconds: 10), () {
                          _timer = Timer.periodic(
                              const Duration(milliseconds: 120), (timer) {
                            increaseByType('a');
                          });
                        });
                      },
                      onLongPressMinus: () {
                        Future.delayed(const Duration(milliseconds: 10), () {
                          _timer = Timer.periodic(
                            const Duration(milliseconds: 120),
                            (timer) {
                              decreaseByType('a');
                            },
                          );
                        });
                      },
                      onPressPlus: () => increaseByType('a'),
                      onPressMinus: () => decreaseByType('a'),
                      onLongPressEnd: () => _timer?.cancel(),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE YOUR BMI',
            onPressed: () => _decisionFunction(),
          )
        ],
      ),
    );
  }
}
