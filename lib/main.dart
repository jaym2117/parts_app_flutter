import 'package:flutter/material.dart';
import 'package:parts_app_flutter/screens/dashboard.dart';
import 'package:parts_app_flutter/screens/forgot_password.dart';
import 'package:parts_app_flutter/screens/loading.dart';
import 'package:parts_app_flutter/screens/new_part.dart';
import 'package:parts_app_flutter/screens/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PartsApp',
      theme: ThemeData(fontFamily: 'Raleway'),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
        NewPartScreen.id: (context) => NewPartScreen(),
        SignIn.id: (context) => SignIn()
      }
    );
  }
}




