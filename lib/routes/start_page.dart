import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/components/primary_button.dart';
import 'package:flutter_car_brands_quiz/routes/quiz_page.dart';
import 'package:flutter_car_brands_quiz/shared/constants.dart';

class StartPage extends StatelessWidget {
  static String routeName = 'start_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    height: 180.0,
                    width: 180.0,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/icon.png'),
                    ),
                  ),
                ),
              ),
              PrimaryButton(
                child: Text(
                  'GET STARTED',
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
