import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'logo',
            child: Container(
              width: 82.0,
              child: Image(
                image: AssetImage('images/logo.png'),
              ),
            ),
          ),
          Hero(
            tag: 'company_name',
            child: Text(
              'DLS',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0,
                  letterSpacing: 5.0,
                  color: Colors.white
              ),
            ),
          ),
          Hero(
            tag: 'app',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'APP',
                style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 23.0,
                    letterSpacing: 5.0,
                    color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}