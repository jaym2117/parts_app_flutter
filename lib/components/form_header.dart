import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  FormHeader({this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(
            title,
            style: TextStyle(
                color: Color(0xFF4A8D66),
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Center(
            child: Text(
              subTitle,
              style: TextStyle(
                  color: Color(0xFFBCBCBC),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}