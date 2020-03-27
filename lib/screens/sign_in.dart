import 'package:flutter/material.dart';
import 'package:parts_app_flutter/screens/forgot_password.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:parts_app_flutter/screens/loading.dart';

import '../components/auth_header.dart';
import '../components/form_header.dart';
import '../components/form_input_field.dart';
import '../components/form_button.dart';
import '../services/parts_api.dart';
import '../screen_transition.dart';

class SignIn extends StatefulWidget {
  static String id = 'sign_in_screen';
  SignIn({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final storage = new FlutterSecureStorage();

  String emailAddress = '';
  String password = '';

  void onChangeEmailHandler(value) {
    setState(() {
      emailAddress = value;
    });
  }

  void onChangePasswordHandler(value) {
    setState(() {
      password = value;
    });
  }

  void onSubmitHandler() async {
    var data = await PartsModel().signInUser(emailAddress: emailAddress, password: password);

    String token = data['token'];
    // Write token to storage
    await storage.write(key: 'X-Auth-Token', value: token);
    Navigator.pushReplacementNamed(context, LoadingScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF195532),
        child: Column(
          children: <Widget>[
            AuthHeader(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    )),
                child: ListView(
                  children: <Widget>[
                    FormHeader(
                        title: 'Welcome Back!',
                        subTitle: 'Please login to your account'),
                    FormInputField(
                        text: 'Email Address',
                        icon: Icon(Icons.email),
                        onChangeHandler: onChangeEmailHandler,
                    ),
                    FormInputField(
                      text: 'Password',
                      icon: Icon(Icons.lock),
                      obscureText: true,
                      onChangeHandler: onChangePasswordHandler,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                          onPressed: () => Navigator.of(context).push(ScreenTransitions().createRoute(ForgotPasswordScreen())),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey),
                          )),
                    ),
                    FormButton(text: 'Sign In', color: Color(0xFF4A8D66), onSubmitHandler: onSubmitHandler,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




