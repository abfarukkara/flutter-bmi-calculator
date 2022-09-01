import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class MissingInputDialog extends StatelessWidget {
  const MissingInputDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Missing Input'),
      content: const Text('All Input Values must be greater than Zero'),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 23,
      ),
      contentTextStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: inAktiveColor,
      elevation: 10,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          style: ElevatedButton.styleFrom(
              onPrimary: aktiveColor, fixedSize: const Size(100, 30)),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Ok',
            style: TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
