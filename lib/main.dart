import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:construction_quiz/providers/quiz_provider.dart';
import 'package:construction_quiz/screens/question_page.dart';
import 'package:construction_quiz/screens/subject_page.dart';
import 'screens/construction_quiz.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => QuizProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (ctx) => QuizUi(),
          '/questions_page': (ctx) => QuestionPage(),
          '/subject_page': (ctx) => SubjectPage(),
        },
      ),
    );
  }
}
