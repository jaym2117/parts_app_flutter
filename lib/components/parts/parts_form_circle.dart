import 'package:flutter/material.dart';

class PartsFormCircle extends StatelessWidget {
  final bool active;
  PartsFormCircle({this.active = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 12.0,
        width: 12.0,
        decoration: BoxDecoration(
            color: active == true ? Color(0xFF4A8D66) : Colors.white,
            border: Border.all(color: Color(0xFF4A8D66)),
            borderRadius: BorderRadius.circular(20.0)
        ),
      ),
    );
  }
}