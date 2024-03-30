import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/widgets/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:get/get.dart';

class FullScreenCodeEditor extends StatelessWidget {
  final CodeController codeEditorController;
  const FullScreenCodeEditor({
    super.key,
    required this.codeEditorController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mossColor,
      body: Stack(
        children: [
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
          CodeEditorWidget(
            isFullScreen: true,
            codeEditorController: codeEditorController,
          ),
          // submitButton(context, question, codeEditorController)
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
            'CODE EDITOR </>'.toUpperCase(),
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
}
