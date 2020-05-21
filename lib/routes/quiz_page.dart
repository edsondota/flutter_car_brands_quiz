import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/components/primary_button.dart';
import 'package:flutter_car_brands_quiz/mock/mock_questions.dart';
import 'package:flutter_car_brands_quiz/models/alternative.dart';
import 'package:flutter_car_brands_quiz/models/question.dart';
import 'package:flutter_car_brands_quiz/routes/result_page.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  static String routeName = 'quiz_page';

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = mockQuestions;
  Question currentQuestion;

  @override
  void initState() {
    super.initState();
    questions.shuffle();
    currentQuestion = questions.removeLast();
    currentQuestion.alternatives.shuffle();
  }

  void updateOption(Alternative alternative) {
    setState(() {
      currentQuestion.alternatives.forEach((element) {
        element.isSelected = false;
      });
      alternative.isSelected = !alternative.isSelected;
    });
  }

  void confirmQuestion() {
    setState(() {
      if (questions.length == 1) {
        Navigator.pushNamed(context, ResultPage.routeName);
        return;
      }

      currentQuestion = questions.removeLast();
      currentQuestion.alternatives.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: _buildQuestion(currentQuestion),
            ),
            Flexible(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: currentQuestion.alternatives.map((alternative) => _buildAlternative(alternative)).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: (currentQuestion.alternatives.any((alternative) => alternative.isSelected))
                          ? PrimaryButton(
                              child: Text('Confirm'),
                              onPressed: confirmQuestion,
                            )
                          : SizedBox(
                              height: 50.0,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlternative(Alternative alternative) => FlatButton(
        onPressed: () => updateOption(alternative),
        color: alternative.isSelected ? Colors.black12 : Colors.transparent,
        child: ListTile(
          leading: alternative.isSelected ? Icon(Icons.label) : Icon(Icons.label_outline),
          title: Text(alternative.title),
        ),
      );

  Widget _buildQuestion(Question question) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 150.0,
              child: Image.asset(question.imageUrl),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              question.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.squadaOne(fontSize: 20.0),
            ),
          ),
        ],
      );
}
