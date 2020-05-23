import 'package:flutter_car_brands_quiz/models/alternative.dart';
import 'package:flutter_car_brands_quiz/models/question.dart';

final List<Question> mockQuestions = [
  Question(
    title: 'This car brand is originally from which country?',
    alternatives: [
      Alternative(title: 'England'),
      Alternative(title: 'USA'),
      Alternative(title: 'Germany', isCorrect: true),
      Alternative(title: 'Japan'),
    ],
    imageUrl: 'assets/bmw-logo.png',
  ),
  Question(
    title: 'This car brand is originally from which country?',
    alternatives: [
      Alternative(title: 'England'),
      Alternative(title: 'USA'),
      Alternative(title: 'Germany'),
      Alternative(title: 'Japan', isCorrect: true),
    ],
    imageUrl: 'assets/toyota-logo.png',
  ),
  Question(
    title: 'This car brand is originally from which country?',
    alternatives: [
      Alternative(title: 'England', isCorrect: true),
      Alternative(title: 'USA'),
      Alternative(title: 'Germany'),
      Alternative(title: 'Japan'),
    ],
    imageUrl: 'assets/mini-logo.png',
  ),
  Question(
    title: 'This car brand is originally from which country?',
    alternatives: [
      Alternative(title: 'England'),
      Alternative(title: 'USA', isCorrect: true),
      Alternative(title: 'Germany'),
      Alternative(title: 'Japan'),
    ],
    imageUrl: 'assets/general-motors-logo.png',
  ),
  Question(
    title: 'This car brand is originally from which country?',
    alternatives: [
      Alternative(title: 'England', isCorrect: true),
      Alternative(title: 'USA'),
      Alternative(title: 'Germany'),
      Alternative(title: 'Japan'),
    ],
    imageUrl: 'assets/rolls-royce-logo.png',
  ),
];
