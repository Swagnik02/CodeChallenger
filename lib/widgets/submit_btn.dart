import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/models/questions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:get/get.dart';

Widget submitButton(
    BuildContext context, QuestionsModel question, CodeController controller) {
  return ElevatedButton(
    onPressed: () {
      SubmitHandler.submitFunction(context, question, controller);
    },
    child: Text(
      'Submit'.toUpperCase(),
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

class SubmitHandler {
  static void submitFunction(BuildContext context, QuestionsModel question,
      CodeController controller) {
    bool isCorrect = checkSolution(question, controller);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.limeAccent,
          title: Text(
            isCorrect ? 'Correct Answer' : 'Incorrect Answer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorPalette.alternateBgColor),
          ),
          content: Text(
            isCorrect
                ? 'Congratulations! Your answer is correct.'
                : 'Sorry, your answer is incorrect.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorPalette.alternateBgColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back(); // Go back twice to return to the previous screen
              },
              child: Text(
                'OK',
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

  static bool checkSolution(
      QuestionsModel question, CodeController controller) {
    return controller.text == question.solution;
  }
}
