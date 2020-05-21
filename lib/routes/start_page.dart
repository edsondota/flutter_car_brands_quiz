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
                height: 180.0,
                width: 180.0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/icon.png'),
                ),
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
