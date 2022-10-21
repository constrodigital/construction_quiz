import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../widgets/questionlist.dart';
import 'construction_quiz.dart';
import '../widgets/answer_options.dart';
import 'result.dart';

import 'package:http/http.dart' as http;

class QuestionPage extends StatefulWidget {
  static const routeName = '/questions_page';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionPageState();
  }
}

class QuestionPageState extends State<QuestionPage> {
  var isInit = true;
  // var questions = [
  //   {
  //     'questionText': 'What is 1 + 1',
  //     'answers': [
  //       {'text': '1', 'score': '0'},
  //       {'text': '2', 'score': '1'},
  //       {'text': '5', 'score': '0'},
  //       {'text': '6', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'Tallest Mountain in the world',
  //     'answers': [
  //       {'text': 'Mount Everest', 'score': '1'},
  //       {'text': 'Mount Fuji', 'score': '0'},
  //       {'text': 'Mount Kilimanjaro', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'Largest Country in the world',
  //     'answers': [
  //       {'text': 'Germany', 'score': '0'},
  //       {'text': 'India', 'score': '0'},
  //       {'text': 'Russia', 'score': '1'},
  //       {'text': 'Nepal', 'score': '0'},
  //       {'text': 'France', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'Capital of India',
  //     'answers': [
  //       {'text': 'Maharashtra', 'score': '0'},
  //       {'text': 'Delhi', 'score': '1'},
  //       {'text': 'Bihar', 'score': '0'},
  //       {'text': 'Tamil Nadu', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'What is 1 + 1',
  //     'answers': [
  //       {'text': '1', 'score': '0'},
  //       {'text': '2', 'score': '1'},
  //       {'text': '5', 'score': '0'},
  //       {'text': '6', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'Tallest Mountain in the world',
  //     'answers': [
  //       {'text': 'Mount Everest', 'score': '1'},
  //       {'text': 'Mount Fuji', 'score': '0'},
  //       {'text': 'Mount Kilimanjaro', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'Largest Country in the world',
  //     'answers': [
  //       {'text': 'Germany', 'score': '0'},
  //       {'text': 'India', 'score': '0'},
  //       {'text': 'Russia', 'score': '1'},
  //       {'text': 'Nepal', 'score': '0'},
  //       {'text': 'France', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'Capital of India',
  //     'answers': [
  //       {'text': 'Maharashtra', 'score': '0'},
  //       {'text': 'Delhi', 'score': '1'},
  //       {'text': 'Bihar', 'score': '0'},
  //       {'text': 'Tamil Nadu', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'What is 1 + 1',
  //     'answers': [
  //       {'text': '1', 'score': '0'},
  //       {'text': '2', 'score': '1'},
  //       {'text': '5', 'score': '0'},
  //       {'text': '6', 'score': '0'},
  //     ],
  //   },
  //   {
  //     'questionText': 'Tallest Mountain in the world',
  //     'answers': [
  //       {'text': 'Mount Everest', 'score': '1'},
  //       {'text': 'Mount Fuji', 'score': '0'},
  //       {'text': 'Mount Kilimanjaro', 'score': '0'},
  //     ],
  //   },
  // ];
  var questions = [];
  var quizName = "";
  var level = "";
  final quizQuestionsUrl =
      "http://www.squareexpert.com/ccappapi/get_quiz_questions.php?id=";
  int questionIndex = 0;

  void questionIncrementer() {
    //totalScore += score;
    setState(() {
      questionIndex += 1;
      print(questionIndex);
    });
  }

  void gotoQuestion(int questionNumber) {
    questionIndex = questionNumber;
    QuestionPageState();
  }

  void restart() {
    questionIndex = 0;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => QuizUi()),
    );
  }

  void next() {
    setState(() {
      questionIndex += 1;
    });
  }

  void previous() {
    setState(() {
      if (questionIndex >= 1) {
        questionIndex -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var quizDetails = ModalRoute.of(context)!.settings.arguments as Map;
    final providerDataForLevelsQuestions = Provider.of<QuizProvider>(context);
    level = quizDetails['level'];
    quizName = quizDetails['quizname'];
    var questionImage = "images/Space for Image.png";

    if (isInit) {
      Provider.of<QuizProvider>(context).getQuestions(level, quizName);
    }
    isInit = false;

    // void getQuestions() async {
    //   try {
    //     print("This is url:" +
    //         quizQuestionsUrl +
    //         level +
    //         "&type=" +
    //         quizName.toString());
    //     final response = await http.get(Uri.parse(
    //         quizQuestionsUrl + level + "&type=" + quizName.toString()));
    //     //final List<String> tempQuizType = [];
    //     final extractedQuestions = jsonDecode(response.body) as List;
    //     // for (var num = 0; num < extractedQuizLevels.length; num++) {
    //     //   tempQuizType.add((extractedQuizLevels[num]["levels"]).toString());
    //     // }
    //     print(extractedQuestions);
    //     if (!mounted) return;
    //     setState(() {
    //       questions = extractedQuestions;
    //     });
    //   } catch (Exception) {
    //     throw Exception;
    //   }
    // }

    // String i = (args!['index']).toString();
    // int? index = int.parse(i.toString());
    //getQuestions();

    final media = MediaQuery.of(context).size;

    final appbar = AppBar(
      backgroundColor: Colors.purple[200],
      centerTitle: true,
      title: Text(level),
    );

    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: appbar,
        body: questionIndex < providerDataForLevelsQuestions.questions.length
            ? Column(
                children: <Widget>[
                  // Container(
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.rectangle,
                  //     color: Colors.purple[200],
                  //   ),
                  //   margin: EdgeInsets.all(35),
                  //   padding: EdgeInsets.all(15),
                  //   child: Center(
                  //     child: Text(
                  //       "Questions Page",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //           color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Container(
                  //     margin: EdgeInsets.only(right: 20),
                  //     padding: EdgeInsets.all(10),
                  //     decoration: BoxDecoration(
                  //         border: Border.all(width: 2, color: Colors.purple),
                  //         borderRadius: BorderRadius.all(Radius.circular(150))),
                  //     child: Text(
                  //       "4/10",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold, fontSize: 16),
                  //     ),
                  //   ),
                  // ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 10),
                          child: Text(
                            (questionIndex + 1).toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          )),
                      QuestionList(providerDataForLevelsQuestions
                          .questions[questionIndex]['question'] as String)
                    ],
                  ),
                  (questionImage == null)
                      ? SizedBox(
                          height: media.height * 0.08,
                        )
                      : SizedBox(
                          //margin: EdgeInsets.only(bottom: 15),
                          height: media.height * 0.15,
                          width: media.width * 0.77,
                          child: Image(image: AssetImage(questionImage)),
                        ),
                  Container(
                    height: media.height * 0.35,
                    child: ListView(
                      children: [
                        Column(
                          children: <Widget>[
                            // ...(questions[questionIndex]['answers']
                            //         as List<Map<String, Object>>)
                            //     .map((answer) {
                            //   return AnswerOption(() {
                            //     questionIncrementer();
                            //   }, answer['text'] as String);
                            // }).toList(),
                            AnswerOption(() {
                              questionIncrementer();
                            },
                                providerDataForLevelsQuestions
                                    .questions[questionIndex]['option1']),
                            AnswerOption(() {
                              questionIncrementer();
                            },
                                providerDataForLevelsQuestions
                                    .questions[questionIndex]['option2']),
                            AnswerOption(() {
                              questionIncrementer();
                            },
                                providerDataForLevelsQuestions
                                    .questions[questionIndex]['option3']),
                            AnswerOption(() {
                              questionIncrementer();
                            },
                                providerDataForLevelsQuestions
                                    .questions[questionIndex]['option4']),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: media.width * 0.12,
                        child: ElevatedButton(
                          child: Icon(Icons.keyboard_arrow_left),
                          onPressed: previous,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                        ),
                      ),
                      Container(
                        width: media.width * 0.12,
                        child: ElevatedButton(
                          child: Icon(Icons.keyboard_arrow_right),
                          onPressed: next,
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                        ),
                      )
                    ],
                  )
                ],
              )
            : Result(restart));
  }
}
