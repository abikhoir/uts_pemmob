// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/answer_button.dart';
import '../widgets/score_display.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz'), centerTitle: true),
      body: Consumer<QuizProvider>(
        builder: (context, quiz, child) {
          if (quiz.isQuizCompleted) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Quiz Selesai!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ScoreDisplay(
                    score: quiz.score,
                    totalQuestions: quiz.questions.length,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      quiz.resetQuiz();
                      Navigator.pop(context);
                    },
                    child: const Text('Kembali ke Beranda'),
                  ),
                ],
              ),
            );
          }

          final currentQuestion = quiz.currentQuestion;
          if (currentQuestion == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Menampilkan nomor pertanyaan
                Text(
                  'Pertanyaan ${quiz.currentIndex + 1}/${quiz.questions.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Menampilkan teks pertanyaan
                Text(
                  currentQuestion.questionText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Menampilkan opsi jawaban
                ...currentQuestion.options.map((option) {
                  final isSelected =
                      quiz.selectedAnswers.length > quiz.currentIndex
                          ? quiz.selectedAnswers[quiz.currentIndex] == option
                          : false;
                  // Hapus penggunaan isCorrect di quiz!
                  return AnswerButton(
                    text: option,
                    isSelected: isSelected,
                    // Hilangkan isCorrect di sini!
                    onTap: () {
                      if (!quiz.isQuizCompleted) {
                        quiz.selectAnswer(option);
                      }
                    },
                  );
                }),

                const SizedBox(height: 24),

                // Tombol untuk pindah ke pertanyaan berikutnya
                if (!quiz.isQuizCompleted)
                  ElevatedButton(
                    onPressed: () {
                      if (quiz.currentIndex < quiz.questions.length - 1) {
                        quiz.nextQuestion();
                      } else {
                        quiz.submitQuiz();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      quiz.currentIndex < quiz.questions.length - 1
                          ? 'Selanjutnya'
                          : 'Selesai',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
