import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  static String routeName = 'start_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0XFF2D291E), borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: FlatButton(
                  onPressed: () {},
                  child: Text('GET STARTED'),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
