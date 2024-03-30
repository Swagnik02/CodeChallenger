import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/models/questions_model.dart';
import 'package:code_challenger/widgets/dropdown_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolveProblemScreen extends StatelessWidget {
  final QuestionsModel question;
  const SolveProblemScreen({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mossColor,
      body: Stack(
        children: [
          // back button
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),

          // questionName
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _questionName(context),
              ],
            ),
          ),
          //  countdownTImer

          // SizedBox(
          //   height: 100,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: _countDownTimer(),
          //   ),
          // ),

          // mainbody
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Material(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(35),
                topLeft: Radius.circular(35),
              ),
              color: ColorPalette.alternateBgColor,
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                width: Get.width,
                height: Get.height,
                child: _mainBody(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DropDownTile(
            title: 'Problem Statement',
            content: question.problemStatement,
          ),
          DropDownTile(
            title: 'Sample Input',
            content: question.sampleInput,
          ),
          DropDownTile(
            title: 'Sample Output',
            content: question.sampleOutput,
          ),
          DropDownTile(
            title: 'Code Editor </>',
            content: 'codeEditor',
          ),
          _submitButton(),
        ],
      ),
    );
  }

  Widget _questionName(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          // width: Get.width / 5,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            textAlign: TextAlign.center,
            question.questionName.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorPalette.alternateBgColor,
              fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Submit'.toUpperCase(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ));
  }
}
