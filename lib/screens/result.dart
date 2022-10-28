import 'package:flutter/material.dart';
import '../widgets/result_question_boxes.dart';

class Result extends StatelessWidget {
  final Color g = Colors.green;
  final Color r = Colors.red;
  final VoidCallback restart;

  Result(this.restart);
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    // return Container(
    //   child: Column(
    //     children: [
    //       Center(child: Text('Done')),
    //       RaisedButton(
    //         child: Text('Restart Quiz'),
    //         onPressed: restart,
    //       ),
    //     ],
    //   ),
    // );
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: media.height * 0.9,
        width: media.width * 1,
        child: Column(children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30),
                    bottomEnd: Radius.circular(30)),
                //shape: BoxShape.circle,
                color: Theme.of(context).accentColor,
              ),
              margin: EdgeInsets.all(35),
              padding: EdgeInsets.all(20),
              child: Text(
                "Result Page",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          Center(
            child: Text(
              "Subject Name",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Center(
            child: Card(
              margin: EdgeInsets.only(top: 10, bottom: 15),
              elevation: 10,
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(8),
                child: Text(
                  "Score = 5/10",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              "Time Taken = 2.45 min",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20),
            ),
          ),
          Container(
            width: media.width * 0.8,
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ResultQuestionBox("1", g),
                ResultQuestionBox("2", r),
                ResultQuestionBox("3", g),
                ResultQuestionBox("4", g),
                ResultQuestionBox("5", r),
              ],
            ),
          ),
          Container(
            width: media.width * 0.8,
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ResultQuestionBox("6", r),
                ResultQuestionBox("7", g),
                ResultQuestionBox("8", r),
                ResultQuestionBox("9", g),
                ResultQuestionBox("10", r),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "Correct = 5",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "Wrong = 5",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
