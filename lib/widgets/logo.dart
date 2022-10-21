import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(width: 0.5)),
      width: 20,
      height: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
        ),
        child: Image(
          image: AssetImage('images/logo.png'),
        ),
      ),
    );
  }
}
