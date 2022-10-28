import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:construction_quiz/widgets/chapter_box.dart';
import 'package:http/http.dart' as http;

import '../providers/quiz_provider.dart';

class SubjectPage extends StatefulWidget {
  static const routeName = '/subject_page';

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  String quizName = "";
  var temp;
  var isInit = true;

  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    temp = ModalRoute.of(context)?.settings.arguments.toString();
    quizName = temp.toString();
    final providerDataForLevels = Provider.of<QuizProvider>(context);

    print("This is Temp:" + temp.toString());
    print(quizName);
    if (isInit) {
      Provider.of<QuizProvider>(context).getTypeLevels(quizName);
    }
    isInit = false;

    // void getTypeLevels(quizType) async {
    //   try {
    //     print("This is url:" + quizLevelUrl + (quizName).toString());
    //     final response =
    //         await http.get(Uri.parse(quizLevelUrl + quizName.toString()));
    //     //final List<String> tempQuizType = [];
    //     final extractedQuizLevels = jsonDecode(response.body) as List;
    //     // for (var num = 0; num < extractedQuizLevels.length; num++) {
    //     //   tempQuizType.add((extractedQuizLevels[num]["levels"]).toString());
    //     // }
    //     print(extractedQuizLevels);
    //     if (!mounted) return;
    //     setState(() {
    //       quizTypeLevel = extractedQuizLevels;
    //     });
    //   } catch (Exception) {
    //     throw Exception;
    //   }
    // };

    final appbar = AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Text(quizName),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appbar,

      // appBar: AppBar(
      //   backgroundColor: Colors.purple[200],
      //   title: Center(
      //     child: Text("Subject Name"),
      //   ),
      // ),
      body: Column(children: <Widget>[
        // Center(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       //shape: BoxShape.circle,
        //       color: Colors.purple[200],
        //     ),
        //     margin: EdgeInsets.all(35),
        //     padding: EdgeInsets.all(20),
        //     child: Text(
        //       quizName,
        //       style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 20,
        //           color: Colors.white),
        //     ),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Wrong = 80", style: TextStyle(fontSize: 18)),
                Text("Right = 20", style: TextStyle(fontSize: 18)),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CircularProgressIndicator(
                    value: 0.2,
                    backgroundColor: Theme.of(context).accentColor,
                    strokeWidth: 8,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    //margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "20/100",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.65,
          child: ListView.builder(
            itemCount: providerDataForLevels.quizTypeLevel.length,
            itemBuilder: (context, i) => ChapterBox(
                (i + 1),
                providerDataForLevels.quizTypeLevel[i]["levels"],
                "2",
                quizName),
          ),
        ),
      ]),
    );
  }
}
