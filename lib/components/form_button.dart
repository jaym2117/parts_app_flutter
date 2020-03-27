import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Color color;
  final onSubmitHandler;

  FormButton({this.text, this.color, this.onSubmitHandler});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: RaisedButton(
        color: color,
        onPressed: onSubmitHandler,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.0,
          ),
        ),
      ),
    );
  }
}