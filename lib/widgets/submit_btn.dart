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
          title: Text(isCorrect ? 'Correct Answer' : 'Incorrect Answer'),
          content: Text(isCorrect
              ? 'Congratulations! Your answer is correct.'
              : 'Sorry, your answer is incorrect.'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back(); // Go back twice to return to the previous screen
              },
              child: Text('OK'),
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
