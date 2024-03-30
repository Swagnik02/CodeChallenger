import 'package:code_challenger/common/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showLeaveConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.limeAccent,
        title: const Text(
          'Leave Test?',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorPalette.alternateBgColor),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.alternateBgColor),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text(
              'Leave',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.alternateBgColor),
            ),
          ),
        ],
      );
    },
  );
}
