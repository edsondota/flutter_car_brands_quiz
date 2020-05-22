import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/components/primary_button.dart';
import 'package:flutter_car_brands_quiz/models/alternative.dart';
import 'package:flutter_car_brands_quiz/models/question.dart';
import 'package:flutter_car_brands_quiz/routes/result_page.dart';
import 'package:flutter_car_brands_quiz/shared/constants.dart';

class QuestionWidget extends StatefulWidget {
  final List<Question> questions;

  QuestionWidget({
    this.questions,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  Question currentQuestion;
  List<Question> answeredQuestions;

  @override
  void initState() {
    super.initState();
    answeredQuestions = [];
    widget.questions.shuffle();
    currentQuestion = widget.questions.removeLast();
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
    answeredQuestions.add(currentQuestion);
    setState(() {
      if (widget.questions.length == 1) {
        Navigator.pushNamed(
          context,
          ResultPage.routeName,
          arguments: answeredQuestions,
        );
        return;
      }

      currentQuestion = widget.questions.removeLast();
      currentQuestion.alternatives.shuffle();
    });
  }

  Widget _buildAlternative(Alternative alternative) => FlatButton(
        onPressed: () => updateOption(alternative),
        color: alternative.isSelected ? Colors.black12 : Colors.transparent,
        child: ListTile(
          leading: alternative.isSelected ? Icon(Icons.label) : Icon(Icons.label_outline),
          title: Text(
            alternative.title,
            style: body1,
          ),
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
              style: body1,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          child: Text(
                            'Confirm',
                            style: body1,
                          ),
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
    );
  }
}
