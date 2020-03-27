import 'package:flutter/material.dart';

class DLSCard extends StatelessWidget {
  final String cardTitle;
  final String cardInfo;
  final AssetImage img;
  final onTapHandler;

  DLSCard({this.cardTitle, this.cardInfo, this.img, this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: onTapHandler,
        child: Container(
          height: 160.0,
          decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 0.5)),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Image(
                  image: img,
                  width: 96.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Text(
                        cardTitle,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0),
                      ),
                    ),
                    Container(
                      width: 200.0,
                      child: Text(
                        cardInfo,
                        style: TextStyle(letterSpacing: 3.0, fontSize: 11.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}