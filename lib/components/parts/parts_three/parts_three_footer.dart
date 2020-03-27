import 'package:flutter/material.dart';
import '../../form_button.dart';
import '../parts_form_circle.dart';

class PartsThreeFooter extends StatelessWidget {
  final nextPage;
  final backPage;
  PartsThreeFooter({this.nextPage, this.backPage});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: FormButton(
                  color: Color(0xFF3E3E3E),
                  text: 'Back',
                  onSubmitHandler: backPage,
                ),
              ),
              Expanded(
                child: FormButton(
                  color: Color(0xFF4A8D66),
                  text: 'Next',
                  onSubmitHandler: nextPage,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PartsFormCircle(),
              PartsFormCircle(),
              PartsFormCircle(active: true,),
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