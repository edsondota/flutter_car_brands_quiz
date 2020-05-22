import 'dart:async';
import 'dart:convert';

import 'package:flutter_car_brands_quiz/models/alternative.dart';
import 'package:flutter_car_brands_quiz/models/question.dart';
import 'package:flutter_car_brands_quiz/networking/api_provider.dart';

class QuestionRepository {
  ApiProvider _provider = ApiProvider();

  Future<List<Question>> fetchQuestions(String baseUrl) async {
    print(baseUrl);
    final response = await _provider.get("$baseUrl/questions");
    final parsed = jsonDecode(response).cast<Map<String, dynamic>>();

    return parsed.map<Question>((model) {
      var question = Question.fromJson(model);
      question.alternatives = model['alternatives'].map<Alternative>((alt) => Alternative.fromJson(alt)).toList();
      return question;
    }).toList();
  }
}
