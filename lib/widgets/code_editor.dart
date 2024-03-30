import 'dart:developer';

import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/common/utils.dart';
import 'package:code_challenger/screens/TestsScreen/AllProblemsScreen/full_screen_code_editor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:get/get.dart';

class CodeEditorWidget extends StatefulWidget {
  final CodeController codeEditorController;
  final bool isFullScreen;

  const CodeEditorWidget({
    Key? key,
    required this.codeEditorController,
    this.isFullScreen = false, // Default value for isFullScreen
  }) : super(key: key);

  @override
  _CodeEditorWidgetState createState() => _CodeEditorWidgetState();
}

class _CodeEditorWidgetState extends State<CodeEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorPalette.borderColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          children: [
            editorControls(),
            CodeTheme(
              data: CodeThemeData(styles: monokaiSublimeTheme),
              child: SingleChildScrollView(
                child: CodeField(
                  gutterStyle: const GutterStyle(
                    showErrors: true,
                    showFoldingHandles: false,
                    showLineNumbers: true,
                  ),
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: ColorPalette.alternateBgColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  controller: widget.codeEditorController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editorControls() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.restart_alt_rounded),
          onPressed: () {
            widget.codeEditorController.text = FrequentStrings.defaultCode;
          },
        ),
        IconButton(
          icon: const Icon(CupertinoIcons.play_arrow_solid),
          onPressed: () {
            log(widget.codeEditorController.text);
          },
        ),
        widget.isFullScreen
            ? IconButton(
                icon: const Icon(CupertinoIcons.arrow_down_right_arrow_up_left),
                onPressed: () {
                  Get.back();
                },
              )
            : IconButton(
                icon: const Icon(
                  CupertinoIcons.arrow_up_left_arrow_down_right,
                ),
                onPressed: () {
                  Get.to(
                    FullScreenCodeEditor(
                      codeEditorController: widget.codeEditorController,
                    ),
                  );
                },
              ),
        IconButton(
          onPressed: () {
            widget.codeEditorController.text = Solutions.qId1;
          },
          icon: const Icon(Icons.bug_report),
        ),
      ],
    );
  }
}
