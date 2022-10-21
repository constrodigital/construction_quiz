import 'package:flutter/material.dart';
import 'package:construction_quiz/screens/question_page.dart';

class ResultQuestionBox extends StatelessWidget {
  String index;
  final Color c;

  ResultQuestionBox(this.index, this.c);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.pushNamed(context, '/questions_page',
      //     arguments: {'index': index}),
      onTap: () => print(index),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: c,
            border: Border.all(width: 0.5, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          index,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
