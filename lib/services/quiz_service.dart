// lib/services/quiz_service.dart

import '../models/question_model.dart';
import 'dart:math';

class QuizService {
  // List pertanyaan untuk quiz
  static final List<Question> questions = [
    Question(
      questionText: "Apa yang dimaksud dengan D4 Manajemen Informatika?",
      options: [
        "Diploma IV dalam bidang teknologi informasi",
        "Diploma III dalam bidang manajemen",
        "Diploma IV dalam bidang akuntansi",
        "Diploma III dalam bidang teknik"
      ],
      correctAnswer: "Diploma IV dalam bidang teknologi informasi",
      category: "Pengenalan Program Studi",
      explanation:
          "D4 Manajemen Informatika adalah program studi diploma tingkat 4 yang fokus pada pengembangan sistem informasi dan teknologi informasi dalam konteks manajemen.",
    ),
    Question(
      questionText: "Bahasa pemrograman apa yang digunakan di Flutter?",
      options: ["Java", "Kotlin", "Dart", "Python"],
      correctAnswer: "Dart",
      category: "Teknologi Informasi",
      explanation:
          "Flutter menggunakan bahasa pemrograman Dart untuk membangun aplikasi lintas platform.",
    ),
    Question(
      questionText: "Apa kepanjangan dari API dalam teknologi informasi?",
      options: [
        "Application Programming Interface",
        "Advanced Programming Interface",
        "Automated Process Integration",
        "Application Process Interface"
      ],
      correctAnswer: "Application Programming Interface",
      category: "Teknologi Informasi",
      explanation:
          "API adalah singkatan dari Application Programming Interface, yaitu antarmuka yang memungkinkan dua aplikasi berkomunikasi satu sama lain.",
    ),
    Question(
      questionText: "Apa itu algoritma dalam pemrograman?",
      options: [
        "Sebuah perangkat keras komputer",
        "Langkah-langkah terstruktur untuk menyelesaikan masalah",
        "Sebuah bahasa pemrograman",
        "Sebuah database"
      ],
      correctAnswer: "Langkah-langkah terstruktur untuk menyelesaikan masalah",
      category: "Dasar Pemrograman",
      explanation:
          "Algoritma adalah serangkaian langkah-langkah logis yang dirancang untuk menyelesaikan masalah tertentu.",
    ),
    Question(
      questionText: "Manakah yang merupakan sistem operasi?",
      options: ["Microsoft Word", "Windows 10", "Google Chrome", "Adobe Photoshop"],
      correctAnswer: "Windows 10",
      category: "Teknologi Informasi",
      explanation:
          "Sistem operasi adalah perangkat lunak yang mengelola perangkat keras dan perangkat lunak komputer. Contohnya adalah Windows 10.",
    ),
    Question(
      questionText: "Apa yang dimaksud dengan UI dalam desain aplikasi?",
      options: [
        "User Interaction",
        "User Interface",
        "Unified Input",
        "Universal Integration"
      ],
      correctAnswer: "User Interface",
      category: "Desain Aplikasi",
      explanation:
          "UI adalah singkatan dari User Interface, yaitu elemen-elemen visual yang digunakan pengguna untuk berinteraksi dengan aplikasi.",
    ),
    Question(
      questionText: "Apa fungsi dari database dalam sistem informasi?",
      options: [
        "Menyimpan data secara permanen",
        "Mengontrol perangkat keras",
        "Menjalankan aplikasi",
        "Menghubungkan jaringan internet"
      ],
      correctAnswer: "Menyimpan data secara permanen",
      category: "Sistem Informasi",
      explanation:
          "Database digunakan untuk menyimpan, mengelola, dan mengorganisasi data secara permanen agar dapat diakses kapan saja.",
    ),
    Question(
      questionText: "Apa nama framework JavaScript untuk membangun aplikasi web?",
      options: ["React", "Flutter", "Swift", "Ruby"],
      correctAnswer: "React",
      category: "Teknologi Informasi",
      explanation:
          "React adalah framework JavaScript populer yang digunakan untuk membangun antarmuka pengguna pada aplikasi web.",
    ),
    Question(
      questionText: "Apa yang dimaksud dengan debugging dalam pemrograman?",
      options: [
        "Proses merancang tampilan aplikasi",
        "Proses mencari dan memperbaiki kesalahan dalam kode",
        "Proses menginstal aplikasi",
        "Proses menjalankan aplikasi"
      ],
      correctAnswer: "Proses mencari dan memperbaiki kesalahan dalam kode",
      category: "Dasar Pemrograman",
      explanation:
          "Debugging adalah proses mencari, mengidentifikasi, dan memperbaiki kesalahan (bug) dalam kode program.",
    ),
    Question(
      questionText: "Apa yang dimaksud dengan cloud computing?",
      options: [
        "Komputasi yang dilakukan di komputer lokal",
        "Penyimpanan data di server jarak jauh melalui internet",
        "Penggunaan perangkat keras fisik",
        "Pengembangan aplikasi desktop"
      ],
      correctAnswer: "Penyimpanan data di server jarak jauh melalui internet",
      category: "Teknologi Informasi",
      explanation:
          "Cloud computing adalah teknologi yang memungkinkan penyimpanan dan akses data melalui internet tanpa menggunakan perangkat keras lokal.",
    ),
  ];

   // Mengambil semua pertanyaan
  static List<Question> getQuestions() {
    return List.from(questions);
  }

  // Mengambil pertanyaan berdasarkan kategori
  static List<Question> getQuestionsByCategory(String category) {
    return questions.where((q) => q.category == category).toList();
  }

  // Mengacak urutan pertanyaan
  static List<Question> shuffleQuestions(List<Question> questions) {
    final random = Random();
    return List.from(questions)..shuffle(random);
  }

  // Mengambil pertanyaan acak
  static List<Question> getRandomQuestions(int count) {
    final allQuestions = List<Question>.from(questions); // Pastikan ini List<Question>
    final random = Random();
    allQuestions.shuffle(random);
    return allQuestions.take(count).toList(); // Ini akan menghasilkan List<Question>
  }
}