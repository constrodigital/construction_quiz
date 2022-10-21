import 'package:flutter/material.dart';

class AnswerOption extends StatelessWidget {
  final VoidCallback btnPressed;
  final ans;

  AnswerOption(this.btnPressed, this.ans);
  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    final devWidth = MediaQuery.of(context).size.width;
    return Container(
      width: devWidth * 0.9,
      child: ElevatedButton(
        child: Text(ans),
        onPressed: btnPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black)),
      ),
    );
  }
}
