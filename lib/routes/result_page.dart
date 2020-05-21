import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/components/primary_button.dart';
import 'package:flutter_car_brands_quiz/routes/quiz_page.dart';
import 'package:flutter_car_brands_quiz/shared/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  static String routeName = 'result_page';

  @override
  Widget build(BuildContext context) {
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
                        '70%',
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
                                flex: 70,
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
                                flex: 30,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet!',
                          style: GoogleFonts.squadaOne(fontSize: 18.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              PrimaryButton(
                child: Text('PLAY AGAIN'),
                onPressed: () => Navigator.pushNamed(context, QuizPage.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
