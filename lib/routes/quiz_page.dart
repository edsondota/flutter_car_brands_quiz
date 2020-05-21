import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/components/primary_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPage extends StatefulWidget {
  static String routeName = 'quiz_page';

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var options = [];
  @override
  void initState() {
    super.initState();
    options = [
      {
        'option': 'Japan',
        'isCorrect': false,
        'isSelected': false,
      },
      {
        'option': 'Brazil',
        'isCorrect': false,
        'isSelected': false,
      },
      {
        'option': 'France',
        'isCorrect': false,
        'isSelected': false,
      },
      {
        'option': 'Deustach',
        'isCorrect': false,
        'isSelected': false,
      },
    ];
  }

  void updateOption(int index) {
    if (!options[index]['isSelected']) {
      options.forEach((element) {
        element['isSelected'] = false;
      });
      setState(() {
        options[index]['isSelected'] = true;
      });
    } else {
      setState(() {
        options[index]['isSelected'] = false;
      });
    }
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
              child: _buildQuestion(),
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
                        children: options.asMap().entries.map((entry) {
                          var item = entry.value;
                          return _buildAlternative(item['isSelected'], entry.key, item['option']);
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: (options.any((item) => item['isSelected']))
                          ? PrimaryButton(
                              child: Text('Confirm'),
                              onPressed: () {},
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

  Widget _buildAlternative(bool isSelected, int key, String option) => FlatButton(
        onPressed: () => updateOption(key),
        color: isSelected ? Colors.black12 : Colors.transparent,
        child: ListTile(
          leading: isSelected ? Icon(Icons.label) : Icon(Icons.label_outline),
          title: Text(option),
        ),
      );

  Widget _buildQuestion() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 200.0,
              child: Image.asset('assets/mini-logo.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'This car brand is (or was) originally from which country?',
              textAlign: TextAlign.center,
              style: GoogleFonts.squadaOne(fontSize: 20.0),
            ),
          ),
        ],
      );
}
