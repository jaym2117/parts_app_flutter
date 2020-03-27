import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String text;
  final Icon icon;
  final bool obscureText;
  final onChangeHandler;
  FormInputField({this.text, this.icon, this.onChangeHandler, this.obscureText = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChangeHandler,
        decoration: InputDecoration(
          icon: icon,
          labelText: text,
        ),
      ),
    );
  }
}