import 'package:flutter/material.dart';
import '../../form_button.dart';
import '../parts_form_circle.dart';

class PartsOneFooter extends StatelessWidget {
  final nextPage;
  PartsOneFooter({this.nextPage});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FormButton(
            color: Color(0xFF4A8D66),
            text: 'Next',
            onSubmitHandler: nextPage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PartsFormCircle(
                active: true,
              ),
              PartsFormCircle(),
              PartsFormCircle(),
              PartsFormCircle(),
              PartsFormCircle(),
              PartsFormCircle(),
            ],
          ),
        ],
      ),
    );
  }
}