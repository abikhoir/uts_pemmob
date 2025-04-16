// lib/models/question_model.dart
class Question {
  final String questionText; // Pertanyaan
  final List<String> options; // Opsi jawaban
  final String correctAnswer; // Jawaban benar
  final String category; // Kategori pertanyaan
  final String explanation; // Penjelasan jawaban

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    this.category = 'General',
    this.explanation = '',
  });

  // Factory constructor untuk membuat Question dari Map
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['questionText'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
      category: json['category'] ?? 'General',
      explanation: json['explanation'] ?? '',
    );
  }

  // Method untuk memeriksa apakah jawaban benar
  bool isCorrect(String answer) {
    return answer.toLowerCase() == correctAnswer.toLowerCase();
  }
}