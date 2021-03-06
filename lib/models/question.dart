import 'package:flutter_car_brands_quiz/models/alternative.dart';

class Question {
  String title;
  String imageUrl;
  List<Alternative> alternatives;

  Question({
    this.title,
    this.imageUrl,
    this.alternatives,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }
}
