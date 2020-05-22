import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/components/primary_button.dart';
import 'package:flutter_car_brands_quiz/models/question.dart';
import 'package:flutter_car_brands_quiz/models/result_status.dart';
import 'package:flutter_car_brands_quiz/routes/quiz_page.dart';
import 'package:flutter_car_brands_quiz/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  static String routeName = 'result_page';

  double _getScore(List<Question> answeredQuestions) {
    int score = 0;
    answeredQuestions.forEach((question) {
      var isCorrect = question.alternatives.any((alternative) => alternative.isSelected == alternative.isCorrect && alternative.isSelected);
      if (isCorrect) {
        score++;
      }
    });

    double scorePercent = (score / answeredQuestions.length);

    return scorePercent;
  }

  ResultStatus _getStatus(double score) {
    if (score == 1) return ResultStatus.excellent;
    if (score > 0.5) return ResultStatus.good;
    if (score > 0) return ResultStatus.bad;

    return ResultStatus.bad;
  }

  @override
  Widget build(BuildContext context) {
    final answeredQuestions = ModalRoute.of(context).settings.arguments;
    final score = _getScore(answeredQuestions) * 100;
    final scoreStatus = _getStatus(score);

    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(19.0)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${score.toInt()}%',
                        style: GoogleFonts.squadaOne(
                          fontSize: 80.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: kButtonBorderRadius,
                            color: Colors.black12,
                          ),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: score.toInt(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(9.0),
                                      bottomLeft: Radius.circular(9.0),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: (100 - score.toInt()),
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          scoreStatus.description(),
                          style: body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              PrimaryButton(
                child: Text(
                  'PLAY AGAIN',
                  style: body1,
                ),
                onPressed: () => Navigator.pushNamed(context, QuizPage.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
