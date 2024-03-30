import 'package:code_challenger/common/utils.dart';
import 'package:code_challenger/models/questions_model.dart';

class TestsModel {
  String testID; // Changed TEstID to testID to follow naming conventions
  String testName;
  int testDuration;
  List<QuestionsModel> testQuestions;

  TestsModel({
    required this.testID,
    required this.testName,
    required this.testDuration,
    required this.testQuestions,
  });
}

// Create questions for the QuestionsModel
List<QuestionsModel> questions = [
  QuestionsModel(
    questionID: '1',
    questionName: 'Simple Addition',
    problemStatement: 'Perform addition of two numbers.',
    sampleInput: '3 5',
    sampleOutput: '8',
    testCases: ['3 5', '10 20', '15 25'],
    expectedOutputs: ['8', '30', '40'],
    difficultyTag: 0, // Easy
    solution: Solutions.qId1,
  ),
  QuestionsModel(
    questionID: '2',
    questionName: 'Simple Multiplication',
    problemStatement: 'Perform multiplication of two numbers.',
    sampleInput: '3 5',
    sampleOutput: '15',
    testCases: ['3 5', '10 20', '15 25'],
    expectedOutputs: ['15', '200', '375'],
    difficultyTag: 0, // Easy
  ),
  QuestionsModel(
    questionID: '3',
    questionName: 'Simple Division',
    problemStatement: 'Perform division of two numbers.',
    sampleInput: '15 5',
    sampleOutput: '3',
    testCases: ['15 5', '100 20', '81 9'],
    expectedOutputs: ['3', '5', '9'],
    difficultyTag: 0, // Easy
  ),
  QuestionsModel(
    questionID: '4',
    questionName: 'Simple Modulus',
    problemStatement: 'Perform modulus operation of two numbers.',
    sampleInput: '15 4',
    sampleOutput: '3',
    testCases: ['15 4', '100 20', '81 9'],
    expectedOutputs: ['3', '0', '0'],
    difficultyTag: 0, // Easy
  ),
];

// Create tests for the TestsModel
List<TestsModel> availableTests = [
  TestsModel(
    testID: '1',
    testName: 'Test 1',
    testDuration: 30, // Duration in minutes
    testQuestions: questions.sublist(0, 2), // Use the first 2 questions
  ),
  TestsModel(
    testID: '2',
    testName: 'Test 2',
    testDuration: 45, // Duration in minutes
    testQuestions: questions.sublist(2, 4), // Use the next 2 questions
  ),
  TestsModel(
    testID: '3',
    testName: 'Test 3',
    testDuration: 60, // Duration in minutes
    testQuestions: questions.sublist(0, 3), // Use the first 3 questions
  ),
];
