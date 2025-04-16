// lib/widgets/score_display.dart
import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScoreDisplay({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            'Score',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$score/$totalQuestions',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: score / totalQuestions,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(
              score / totalQuestions >= 0.7
                  ? Colors.green
                  : score / totalQuestions >= 0.4
                      ? Colors.orange
                      : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}