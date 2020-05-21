import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  static String routeName = 'start_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Start the game'),
            ),
          ],
        ),
      ),
    );
  }
}
