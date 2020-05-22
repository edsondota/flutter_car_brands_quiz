import 'package:flutter/material.dart';
import 'package:flutter_car_brands_quiz/mock/mock_questions.dart';
import 'package:flutter_car_brands_quiz/repository/question_repository.dart';
import 'package:flutter_car_brands_quiz/routes/quiz_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

QuestionRepository questionRepository;

void main() {
  setUp(() async {});

  testWidgets(
    'Test quiz page loads questions',
    (WidgetTester tester) async {
      await DotEnv().load('.env');
      questionRepository = MockQuestionRepository();

      when(questionRepository.fetchQuestions(DotEnv().env['BASE_URL'])).thenAnswer((_) async => Future.value(mockQuestions));

      final widget = QuizTestWidget(questionRepository);

      await tester.pumpWidget(widget);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      final textFinder = find.text('USA');
      expect(textFinder, findsOneWidget);
    },
  );
}

class QuizTestWidget extends StatelessWidget {
  final questionRepository;

  QuizTestWidget(this.questionRepository) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(
        questionRepository: questionRepository,
      ),
    );
  }
}
