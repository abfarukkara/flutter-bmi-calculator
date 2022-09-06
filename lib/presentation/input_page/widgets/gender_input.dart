import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderInputWidget extends StatelessWidget {
  const GenderInputWidget({
    Key? key,
    required this.backgroundColor,
    required this.foreGroundColor,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Color backgroundColor;
  final Color foreGroundColor;
  final String label;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      height: size.height * 0.23,
      width: size.width * 0.43,
      child: TextButton(
        onPressed: onPressed,
        style: theme.elevatedButtonTheme.style,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: 70,
            ),
            const SizedBox(height: 20),
            Text(
              label,
              style: labelTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
