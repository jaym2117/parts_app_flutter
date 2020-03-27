import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:parts_app_flutter/screens/dashboard.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parts_app_flutter/screens/sign_in.dart';
import '../services/parts_api.dart';
import '../screen_transition.dart';
import '../models/user.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'loading_screen';
  // Create storage
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>  with SingleTickerProviderStateMixin{
  final storage = new FlutterSecureStorage();
  Animation<double> animation;
  AnimationController controller;

  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 172.0).animate(controller)
      ..addListener(() {
          setState(() {

          });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          getToken();
        }
      });
    controller.forward();
  }

  void getToken() async {
    var token = await storage.read(key: 'X-Auth-Token');
    if (token != null) {
      var user = await PartsModel().authenticateUser(token: token);
      Navigator.pushReplacementNamed(context, DashboardScreen.id);
    } else {
      Navigator.pushReplacementNamed(context, SignIn.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF195532),
        child: Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: Image(
              image: AssetImage('images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
