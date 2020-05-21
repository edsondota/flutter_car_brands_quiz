import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/routes/quiz_page.dart';
import 'package:flutter_car_brands_quiz/routes/start_page.dart';

void main() {
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
        QuizPage.routeName: (context) => QuizPage(),
      },
    );
  }
}
