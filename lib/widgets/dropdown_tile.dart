import 'package:code_challenger/common/utils.dart';
import 'package:code_challenger/widgets/code_editor.dart';

import 'package:flutter/material.dart';
import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/models/questions_model.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';

import 'package:highlight/languages/cpp.dart';

class DropDownTile extends StatefulWidget {
  final QuestionsModel? question;
  final String title;
  final String content;

  const DropDownTile({
    super.key,
    this.question,
    required this.title,
    required this.content,
  });

  @override
  _DropDownTileState createState() => _DropDownTileState();
}

class _DropDownTileState extends State<DropDownTile> {
  bool dropdown = false;
  TextEditingController codeController = TextEditingController();
  final codeEditorController = CodeController(
    text: FrequentStrings.defaultCode,
    language: cpp,
  );

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

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
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 5, top: 5, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 270,
                    child: Text(
                      widget.title,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        dropdown = !dropdown;
                        // log(dropdown.toString());
                      });
                    },
                    icon: Icon(dropdown
                        ? Icons.arrow_drop_up_outlined
                        : Icons.arrow_drop_down_outlined),
                  )
                ],
              ),
            ),
            if (dropdown)
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 0, bottom: 15),
                child: Column(
                  children: [
                    if (widget.content == 'codeEditor')
                      CodeEditorWidget(
                        isFullScreen: false,
                        codeEditorController: codeEditorController,
                      )
                    else ...{
                      const Divider(
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 312,
                            child: Text(
                              widget.content,
                              softWrap: true,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorPalette.alternateBgColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .fontSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    }
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
