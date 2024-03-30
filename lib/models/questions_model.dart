class QuestionsModel {
  String questionID;
  String questionName;
  String problemStatement;
  String sampleInput;
  String sampleOutput;
  List<String> testCases;
  List<String> expectedOutputs;
  int difficultyTag;
  String? solution;

  QuestionsModel({
    required this.questionID,
    required this.questionName,
    required this.problemStatement,
    required this.sampleInput,
    required this.sampleOutput,
    required this.testCases,
    required this.expectedOutputs,
    required this.difficultyTag,
    this.solution,
  });
}
