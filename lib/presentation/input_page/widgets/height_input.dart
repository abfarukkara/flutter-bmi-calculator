import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class HeightInputWidget extends StatelessWidget {
  const HeightInputWidget({
    Key? key,
    required this.heightInputValue,
    required this.slider,
  }) : super(key: key);

  final int heightInputValue;
  final Slider slider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Container(
        height: size.height * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(29, 30, 51, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('HEIGHT', style: labelTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  heightInputValue.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'cm',
                  style: labelTextStyle,
                ),
              ],
            ),
            slider
          ],
        ),
      ),
    );
  }
}
