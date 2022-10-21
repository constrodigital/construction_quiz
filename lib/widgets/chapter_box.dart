import 'package:flutter/material.dart';
import '../screens/question_page.dart';

class ChapterBox extends StatelessWidget {
  final int index;
  final String level;
  final String outoff;
  final String quizName;

  ChapterBox(this.index, this.level, this.outoff, this.quizName);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final double v = (double.parse(outoff)) / 10;
    return Container(
      margin: EdgeInsets.all(2),
      //color: Colors.blue,
      //height: 60,
      width: media.size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              index.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            splashColor: Colors.white,
            onTap: () =>
                Navigator.pushNamed(context, '/questions_page', arguments: {
              'level': level,
              'quizname': quizName,
            }),
            child: Container(
              width: media.size.width * 0.7,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.purple),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(level),
                  LinearProgressIndicator(
                    value: 0.3,
                    backgroundColor: Colors.white,
                    minHeight: 12,
                    //strokeWidth: 8,
                    color: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "$outoff /10",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
