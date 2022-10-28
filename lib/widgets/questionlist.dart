import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final String question;
  QuestionList(this.question);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 8),
      padding: EdgeInsets.all(8),
      height: media.size.height * 0.15,
      width: media.size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
