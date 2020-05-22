import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/components/primary_button.dart';
import 'package:flutter_car_brands_quiz/models/question.dart';
import 'package:flutter_car_brands_quiz/repository/question_repository.dart';
import 'package:flutter_car_brands_quiz/routes/question_widget.dart';
import 'package:flutter_car_brands_quiz/routes/start_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class QuizPage extends StatelessWidget {
  static String routeName = 'quiz_page';
  final QuestionRepository _questionRepository = QuestionRepository();
  final String baseUrl = DotEnv().env['BASE_URL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: FutureBuilder<List<Question>>(
          future: _questionRepository.fetchQuestions(baseUrl),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('There is no internet connection'),
                      SizedBox(height: 10.0),
                      PrimaryButton(
                        child: Text('Retry'),
                        onPressed: () => Navigator.pushNamed(context, StartPage.routeName),
                      ),
                    ],
                  ),
                ),
              );

            return snapshot.hasData
                ? QuestionWidget(
                    questions: snapshot.data,
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
