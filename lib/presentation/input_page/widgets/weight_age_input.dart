import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightOrAgeInputWidget extends StatelessWidget {
  const WeightOrAgeInputWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.onLongPressPlus,
    required this.onLongPressMinus,
    required this.onPressPlus,
    required this.onPressMinus,
    required this.onLongPressEnd,
  }) : super(key: key);

  final int value;
  final String label;
  final void Function() onLongPressPlus;
  final void Function() onLongPressMinus;
  final void Function() onPressPlus;
  final void Function() onPressMinus;
  final void Function() onLongPressEnd;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: size.width * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: inAktiveColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: labelTextStyle),
          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onLongPress: onLongPressMinus,
                onLongPressEnd: (details) => onLongPressEnd(),
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: onPressMinus,
                  backgroundColor: const Color.fromRGBO(76, 79, 94, 1),
                  child: const FaIcon(
                    FontAwesomeIcons.minus,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onLongPress: onLongPressPlus,
                onLongPressEnd: (details) => onLongPressEnd(),
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: onPressPlus,
                  backgroundColor: const Color.fromRGBO(76, 79, 94, 1),
                  child: const FaIcon(
                    FontAwesomeIcons.plus,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
