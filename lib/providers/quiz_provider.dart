import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class QuizProvider with ChangeNotifier {
  var questions = [];
  List quizTypes = [];
  String quizName = "";
  var level = "";

  List quizTypeLevel = [];
  //String? quizName = "";

  //getting quiz types

  void getSubjectTypes() async {
    try {
      const getTypes = "http://www.squareexpert.com/ccappapi/get_types.php";

      final response = await http.get(Uri.parse(getTypes));
      //final List<String> tempQuizType = [];
      final extractedData = jsonDecode(response.body) as List;
      quizTypes = extractedData;

      // for (var num = 0; num < extractedData.length; num++) {
      //   tempQuizType.add((extractedData[num]['types']).toString());
      // }
      notifyListeners();
    } catch (Exception) {
      throw Exception;
    }
  }

  //getting levels for quiz types

  void getTypeLevels(String quizName) async {
    const quizLevelUrl =
        "http://www.squareexpert.com/ccappapi/get_type_levels.php?id=";
    try {
      print("This is quiz type name" + quizName);
      print("This is url:" + quizLevelUrl + (quizName).toString());
      final response =
          await http.get(Uri.parse(quizLevelUrl + quizName.toString()));
      //final List<String> tempQuizType = [];
      final extractedQuizLevels = jsonDecode(response.body) as List;
      // for (var num = 0; num < extractedQuizLevels.length; num++) {
      //   tempQuizType.add((extractedQuizLevels[num]["levels"]).toString());
      // }
      //print(extractedQuizLevels);
      quizTypeLevel = extractedQuizLevels;
      notifyListeners();
    } catch (Exception) {
      throw Exception;
    }
  }

  //getting questions for particular quiz level

  void getQuestions(level, quizName) async {
    const quizQuestionsUrl =
        "http://www.squareexpert.com/ccappapi/get_quiz_questions.php?id=";
    try {
      print("This is url:" +
          quizQuestionsUrl +
          level +
          "&type=" +
          quizName.toString());
      final response = await http.get(
          Uri.parse(quizQuestionsUrl + level + "&type=" + quizName.toString()));
      //final List<String> tempQuizType = [];
      final extractedQuestions = jsonDecode(response.body) as List;
      // for (var num = 0; num < extractedQuizLevels.length; num++) {
      //   tempQuizType.add((extractedQuizLevels[num]["levels"]).toString());
      // }
      print(extractedQuestions);

      questions = extractedQuestions;
      notifyListeners();
    } catch (Exception) {
      throw Exception;
    }
  }
}
