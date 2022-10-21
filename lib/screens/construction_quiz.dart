import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:construction_quiz/providers/quiz_provider.dart';

import '../widgets/subject_box.dart';

class QuizUi extends StatefulWidget {
  @override
  State<QuizUi> createState() => _QuizUiState();
}

class _QuizUiState extends State<QuizUi> {
  // final subUrl =
  //     Uri.parse('http://www.squareexpert.com/ccappapi/get_types.php');
  // List subjects = [];
  var isInit = true;
  //
  // void getSubjectTypes() async {
  //   try {
  //     final response = await http.get(subUrl);
  //     //final List<String> tempQuizType = [];
  //     final extractedData = jsonDecode(response.body) as List;
  //     setState(() {
  //       subjects = extractedData;
  //     });
  //
  //     // for (var num = 0; num < extractedData.length; num++) {
  //     //   tempQuizType.add((extractedData[num]['types']).toString());
  //     // }
  //   } catch (Exception) {
  //     throw Exception;
  //   }
  // }

  @override
  void initState() {
    //getSubjectTypes();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<QuizProvider>(context).getSubjectTypes();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<QuizProvider>(context);
    final media = MediaQuery.of(context).size;
    //getSubjectTypes();
    final appbar = AppBar(
      backgroundColor: Colors.purple[200],
      title: Center(
        child: const Text("Construction Quiz"),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: appbar,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: (media.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) *
                  1,
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: providerData.quizTypes.length,
                itemBuilder: (ctx, i) =>
                    SubjectBox(providerData.quizTypes[i]["types"]),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
