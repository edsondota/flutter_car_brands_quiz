import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/repository/question_repository.dart';
import 'package:flutter_car_brands_quiz/routes/quiz_page.dart';
import 'package:flutter_car_brands_quiz/routes/result_page.dart';
import 'package:flutter_car_brands_quiz/routes/start_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Brands Quiz',
      initialRoute: StartPage.routeName,
      routes: {
        StartPage.routeName: (context) => StartPage(),
        QuizPage.routeName: (context) => QuizPage(questionRepository: QuestionRepository()),
        ResultPage.routeName: (context) => ResultPage(),
      },
    );
  }
}
