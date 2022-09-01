import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);
  final Function() onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.069,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: aktiveColor,
          onPrimary: Colors.white,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(
          buttonTitle,
          style: labelTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
