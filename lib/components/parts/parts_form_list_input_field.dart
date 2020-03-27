import 'package:flutter/material.dart';

class PartsFormListInputField extends StatelessWidget {
  final String label;
  final String value;
  final onClickHandler;

  PartsFormListInputField({this.label, this.value, this.onClickHandler});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xFFBCBCBC),
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: onClickHandler,
            child: Container(
              margin: EdgeInsets.all(8.0),
              height: 42.0,
              decoration:
              BoxDecoration(border: Border.all(color: Color(0xFFBCBCBC))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(value),
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}