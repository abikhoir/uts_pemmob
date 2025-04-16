# API Documentation - MI Quiz App

## Overview
MI Quiz App adalah aplikasi quiz untuk mahasiswa D4 Manajemen Informatika yang membantu menguji pengetahuan mereka tentang berbagai topik terkait program studi.

## Components

### Question Model
```dart
class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String category;
  final String explanation;
}