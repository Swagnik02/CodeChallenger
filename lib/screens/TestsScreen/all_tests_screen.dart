import 'dart:ui';

import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/models/tests_model.dart';
import 'package:code_challenger/screens/TestsScreen/ProblemScreen/all_problems_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTestsScreen extends StatefulWidget {
  const AllTestsScreen({Key? key}) : super(key: key);

  @override
  State<AllTestsScreen> createState() => _AllTestsScreenState();
}

class _AllTestsScreenState extends State<AllTestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.alternateBgColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Tests',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: ColorPalette.alternateBgColor,
      body: _buildTestLists(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalette.mossColor,
        onPressed: () {},
        child: const Icon(
          Icons.help_outline_outlined,
          color: ColorPalette.alternateBgColor,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildTestLists() {
    return ListView.builder(
      itemCount: availableTests.length,
      itemBuilder: (context, index) {
        final test = availableTests[index];
        return _TestTiles(test: test);
      },
    );
  }
}

class _TestTiles extends StatelessWidget {
  const _TestTiles({
    super.key,
    required this.test,
  });

  final TestsModel test;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16),
      child: ListTile(
        leading: const Icon(
          Icons.pending_actions_outlined,
          color: Colors.grey,
          size: 35,
        ),
        title: Text(
          test.testName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        trailing: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorPalette.mossColor.withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      test.testDuration.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'mins',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          Get.to(() => AllProblemsScreen(testAssets: test));
        },
      ),
    );
  }
}
