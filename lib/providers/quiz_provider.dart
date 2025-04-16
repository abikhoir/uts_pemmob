// lib/providers/quiz_provider.dart

import 'package:flutter/foundation.dart';
import '../models/question_model.dart';
import '../services/quiz_service.dart';

class QuizProvider with ChangeNotifier {
  // State untuk quiz
  int _currentIndex = 0; // Indeks pertanyaan saat ini
  int _score = 0; // Skor pengguna
  bool _isQuizCompleted = false; // Status apakah quiz selesai
  final Map<int, String> _selectedAnswers = {}; // Jawaban yang dipilih pengguna
  final List<Question> _questions = QuizService.getQuestions(); // Daftar pertanyaan

  // Getter untuk state
  int get currentIndex => _currentIndex;
  int get score => _score;
  bool get isQuizCompleted => _isQuizCompleted;
  List<Question> get questions => _questions;

  // Getter untuk pertanyaan saat ini
  Question? get currentQuestion =>
      _currentIndex < _questions.length ? _questions[_currentIndex] : null;

  // Getter untuk jawaban yang dipilih
  Map<int, String> get selectedAnswers => _selectedAnswers;

  // Method untuk memilih jawaban
  void selectAnswer(String answer) {
    if (_currentIndex < _questions.length) {
      _selectedAnswers[_currentIndex] = answer; // Simpan jawaban untuk indeks saat ini
      notifyListeners();
    }
  }

  // Method untuk pindah ke pertanyaan berikutnya
  void nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++; // Pindah ke pertanyaan berikutnya
      notifyListeners();
    }
  }

  // Method untuk mengirim quiz
  void submitQuiz() {
    if (!_isQuizCompleted) {
      _score = 0; // Reset skor
      for (int i = 0; i < _questions.length; i++) {
        if (_selectedAnswers[i] == _questions[i].correctAnswer) {
          _score++; // Tambah skor jika jawaban benar
        }
      }
      _isQuizCompleted = true; // Tandai quiz sebagai selesai
      notifyListeners();
    }
  }

  // Method untuk reset quiz
  void resetQuiz() {
    _currentIndex = 0; // Reset indeks pertanyaan
    _score = 0; // Reset skor
    _isQuizCompleted = false; // Reset status quiz
    _selectedAnswers.clear(); // Hapus semua jawaban yang dipilih
    notifyListeners();
  }
}