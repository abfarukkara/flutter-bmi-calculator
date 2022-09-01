import 'dart:math';

import 'package:flutter/material.dart';

class BmiBusinessLogic {
  BmiBusinessLogic({
    required this.weight,
    required this.age,
    required this.height,
    required this.isMale,
  });

  final int weight;
  final int age;
  final int height;
  final bool isMale;

  final Map<String, Color?> weightColors = {
    'normal': const Color.fromARGB(255, 81, 228, 164),
    'underweight': const Color.fromRGBO(0, 164, 218, 1),
    'overweight': Colors.yellow[400],
  };

  final Map<String, String> bmiRanges = const {
    'normal': '18,5 - 24,9 kg/m2',
    'underweight': '< 18,5 kg/m2',
    'overweight': '> 24,9 kg/m2',
  };

  final Map<String, String> bmiFeedback = const {
    'normal': 'You have a normal body weight. Good job!',
    'underweight': 'You are underweight. Eat more!',
    'overweight': 'You are overweight!',
  };

  double getBmiValue() {
    final bmi = weight / pow((height / 100), 2);
    return bmi;
  }

  String getBmiInterpretation(double bmiValue) {
    var bmiInterpretationString = '';
    if (bmiValue < 18.5) {
      bmiInterpretationString = 'Underweight';
    } else if (bmiValue > 18.5 && bmiValue < 24.9) {
      bmiInterpretationString = 'Normal';
    } else {
      bmiInterpretationString = 'Overweight';
    }
    return bmiInterpretationString;
  }

  Map<String, dynamic> getBmiInformation() {
    final bmiValue = getBmiValue();
    final bmiInterpretationString = getBmiInterpretation(bmiValue);
    final bmiInterpretationStringLow = bmiInterpretationString.toLowerCase();
    return {
      'bmiValue': bmiValue,
      'bmiInterpretationString': bmiInterpretationString,
      'bmiRangeString': bmiRanges[bmiInterpretationStringLow],
      'weightColor': weightColors[bmiInterpretationStringLow],
      'bmiFeedback': bmiFeedback[bmiInterpretationStringLow]
    };
  }
}
