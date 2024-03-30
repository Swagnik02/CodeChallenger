import 'dart:ui';

import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/models/questions_model.dart';
import 'package:code_challenger/models/tests_model.dart';
import 'package:code_challenger/screens/TestsScreen/AllProblemsScreen/solve_problem_screen.dart';
import 'package:code_challenger/widgets/countdown_timer.dart';
import 'package:code_challenger/widgets/exit_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProblemsScreen extends StatelessWidget {
  final TestsModel testAssets;

  const AllProblemsScreen({
    Key? key,
    required this.testAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.alternateBgColor,
        leading: IconButton(
          onPressed: () {
            showLeaveConfirmationDialog(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              testAssets.testName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            _testID(context),
          ],
        ),
        actions: [
          _countDownTimer(context),
        ],
      ),
      backgroundColor: ColorPalette.alternateBgColor,
      body: _mainBody(context),
    );
  }

  CountdownTimer _countDownTimer(BuildContext context) {
    return CountdownTimer(
      testDuration: testAssets.testDuration,
      onTimerEnd: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Timer Ended',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              content: Text(
                'Time is up!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _mainBody(BuildContext context) {
    return ListView.builder(
      itemCount: testAssets.testQuestions.length,
      itemBuilder: (context, index) {
        QuestionsModel question = testAssets.testQuestions[index];
        return _ProblemTile(question: question);
      },
    );
  }

  Widget _testID(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
            border: Border.all(color: ColorPalette.mossColor),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorPalette.mossColor.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Text(
                      'ID : ${testAssets.testID}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProblemTile extends StatelessWidget {
  final QuestionsModel question;

  const _ProblemTile({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorPalette.mossColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 250,
              child: Text(
                question.questionName,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.alternateBgColor,
                  fontSize:
                      Theme.of(context).textTheme.headlineMedium!.fontSize,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: ColorPalette.alternateBgColor,
                ),
                child: Column(
                  children: [
                    const Text('</>'),
                    Text(
                      _getDifficultyLabel(question.difficultyTag),
                      style: TextStyle(
                        color: ColorPalette.mossColor,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Get.to(() => SolveProblemScreen(
                      question: question,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getDifficultyLabel(int difficulty) {
    switch (difficulty) {
      case 0:
        return 'Easy';
      case 1:
        return 'Medium';
      case 2:
        return 'Hard';
      case 3:
        return 'Very Hard';
      default:
        return 'Unknown';
    }
  }
}
