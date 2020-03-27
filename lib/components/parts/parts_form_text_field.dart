import 'package:flutter/material.dart';
class PartsFormTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String value;
  final enabled;
  final keyboardType;
  final onChangeHandler;


  PartsFormTextField({
    this.label,
    this.hintText = '',
    this.value,
    this.enabled = true,
    this.onChangeHandler,
    this.keyboardType = TextInputType.text
  });

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
          Container(
            margin: EdgeInsets.all(8.0),
            height: 42.0,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFBCBCBC)),
                color: enabled == true ? Colors.white : Color(0xFFBCBCBC),
            ),
            child: TextFormField(
              enabled: enabled,
              keyboardType: keyboardType,
              initialValue: value,
              onChanged: onChangeHandler,
              decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: EdgeInsets.all(8.0),
                  border: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}