// lib/screens/result_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil Quiz'), centerTitle: true),
      body: Consumer<QuizProvider>(
        builder: (context, quiz, child) {
          final totalQuestions = quiz.questions.length;
          final correctAnswers = quiz.score;
          final percentage = ((correctAnswers / totalQuestions) * 100)
              .toStringAsFixed(1);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Tampilkan skor
                // Tampilkan skor & persentase dalam card
                Center(
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                correctAnswers >= (totalQuestions * 0.7)
                                    ? Icons.emoji_events
                                    : Icons.emoji_emotions,
                                color:
                                    correctAnswers >= (totalQuestions * 0.7)
                                        ? Colors.amber[700]
                                        : Colors.blueAccent,
                                size: 36,
                              ),
                              const SizedBox(width: 12),
                              ShaderMask(
                                shaderCallback:
                                    (rect) => LinearGradient(
                                      colors: [
                                        Colors.blue[800]!,
                                        Colors.blue[300]!,
                                      ],
                                    ).createShader(rect),
                                child: Text(
                                  '$correctAnswers / $totalQuestions',
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$percentage% Benar',
                            style: TextStyle(
                              fontSize: 20,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.blue[200]
                                      : Colors.blue[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            correctAnswers >= (totalQuestions * 0.7)
                                ? 'Keren! Kamu menguasai materi ini.'
                                : 'Tetap semangat, kamu pasti bisa lebih baik!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // List semua pertanyaan & jawaban
                Expanded(
                  child: ListView.builder(
                    itemCount: totalQuestions,
                    itemBuilder: (context, index) {
                      final question = quiz.questions[index];
                      final userAnswer = quiz.selectedAnswers[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Q${index + 1}. ${question.questionText}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...question.options.map((option) {
                                final isUserPick = userAnswer == option;
                                final isRightAnswer =
                                    option == question.correctAnswer;
                                Color? color;
                                IconData? icon;
                                FontWeight? fontWeight;

                                if (isRightAnswer) {
                                  color = Colors.green[700];
                                  icon = Icons.check_circle;
                                  fontWeight = FontWeight.bold;
                                } else if (isUserPick) {
                                  color = Colors.red[700];
                                  icon = Icons.cancel;
                                  fontWeight = FontWeight.bold;
                                } else {
                                  color = Colors.grey[800];
                                  icon = null;
                                  fontWeight = null;
                                }

                                return ListTile(
                                  leading:
                                      icon != null
                                          ? Icon(icon, color: color, size: 22)
                                          : const SizedBox(width: 22),
                                  title: Text(
                                    option,
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: fontWeight,
                                    ),
                                  ),
                                  trailing:
                                      isUserPick
                                          ? const Text(
                                            '(jawaban kamu)',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12,
                                            ),
                                          )
                                          : null,
                                  dense: true,
                                  visualDensity: VisualDensity.compact,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                );
                              }),
                              if (question.explanation.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 6,
                                    left: 8,
                                  ),
                                  child: Text(
                                    'Penjelasan: ${question.explanation}',
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),

                // Tombol kembali ke beranda
                ElevatedButton(
                  onPressed: () {
                    quiz.resetQuiz();
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(fontSize: 18),
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
