import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../screens/subject_page.dart';
import './logo.dart';
import '../screens/construction_quiz.dart';

class SubjectBox extends StatelessWidget {
  var subjectName;
  final maxLines = 2;

  SubjectBox(this.subjectName);

  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    final devWidth = MediaQuery.of(context).size.width;
    return GridTile(
      child: FittedBox(
        //fit: BoxFit.cover,
        child: Stack(
          children: <Widget>[
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                splashColor: Theme.of(context).accentColor,
                onTap: () {
                  Navigator.pushNamed(context, '/subject_page',
                      arguments: subjectName);
                },
                child: Container(
                  height: devHeight * 0.15,
                  width: devWidth * 0.5,
                  margin: EdgeInsets.all(20),
                  child: AutoSizeText(
                    subjectName,
                    style: TextStyle(fontSize: 38),
                    maxLines: maxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
