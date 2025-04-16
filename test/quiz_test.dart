// test/quiz_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/providers/quiz_provider.dart';
import 'package:quiz_app/models/question_model.dart';

void main() {
  group('QuizProvider Tests', () {
    late QuizProvider quizProvider;

    setUp(() {
      quizProvider = QuizProvider();
    });

    test('Initial state', () {
      expect(quizProvider.currentIndex, 0);
      expect(quizProvider.score, 0);
      expect(quizProvider.isQuizCompleted, false);
    });

    test('Select answer', () {
      final question = quizProvider.questions[0];
      quizProvider.selectAnswer(question.options[0]);

      expect(quizProvider.selectedAnswers.length, 1);
    });

    test('Next question', () {
      quizProvider.nextQuestion();
      expect(quizProvider.currentIndex, 1);
    });

    test('Submit quiz', () {
      // Pilih jawaban untuk semua pertanyaan
      for (var i = 0; i < quizProvider.questions.length; i++) {
        quizProvider.selectAnswer(quizProvider.questions[i].correctAnswer);
        quizProvider.nextQuestion();
      }

      // Submit quiz
      quizProvider.submitQuiz();
      expect(quizProvider.isQuizCompleted, true);
      expect(quizProvider.score, quizProvider.questions.length);
    });

    test('Reset quiz', () {
      quizProvider.resetQuiz();
      expect(quizProvider.currentIndex, 0);
      expect(quizProvider.score, 0);
      expect(quizProvider.isQuizCompleted, false);
      expect(quizProvider.selectedAnswers.isEmpty, true);
    });
  });

  group('Question Tests', () {
    test('Question model', () {
      final question = Question(
        questionText: 'Test Question',
        options: ['A', 'B', 'C', 'D'],
        correctAnswer: 'A',
        category: 'Test',
        explanation: 'This is a test question',
      );

      expect(question.isCorrect('A'), true);
      expect(question.isCorrect('B'), false);
    });

    test('Question from JSON', () {
      final json = {
        'questionText': 'Test Question',
        'options': ['A', 'B', 'C', 'D'],
        'correctAnswer': 'A',
        'category': 'Test',
        'explanation': 'This is a test question',
      };

      final question = Question.fromJson(json);
      expect(question.questionText, 'Test Question');
      expect(question.options.length, 4);
      expect(question.correctAnswer, 'A');
      expect(question.category, 'Test');
      expect(question.explanation, 'This is a test question');
    });
  });
}