import 'package:flutter/material.dart';

class DLSAppBar extends StatelessWidget with PreferredSizeWidget{
  final GlobalKey<ScaffoldState> scaffoldKey;

  DLSAppBar(this.scaffoldKey);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.account_circle),iconSize: 40.0, color: Colors.white, onPressed: () => print('Admin Page'),)
      ],
      backgroundColor: Color(0xFF195532),
      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Hero(
              tag: 'logo',
              child: Container(
                width: 42.0,
                child: Image(
                  image: AssetImage('images/logo.png'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'DLS',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'APP',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 3.0,
            ),
          )
        ],
      ),
    );
  }
}
