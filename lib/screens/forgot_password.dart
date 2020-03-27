import 'package:flutter/material.dart';
import '../components/auth_header.dart';
import '../components/form_header.dart';
import '../components/form_input_field.dart';
import '../components/form_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String id = 'forgot_password_screen';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String emailAddress = '';

  void onChangeEmailHandler(value) {
    setState(() {
      emailAddress = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 0.0),
                      child: FormHeader(
                          title: 'Forgot Your Password?',
                          subTitle:
                              'Enter an email address and we can send you a reset link'),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView(
                        children: <Widget>[
                          FormInputField(
                            text: 'Email Address',
                            icon: Icon(Icons.email),
                            onChangeHandler: onChangeEmailHandler,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  'Go Back',
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                        ],
                      ),
                    ),
                    FormButton(
                      text: 'Send Request',
                      color: Color(0xFF3E3E3E),
                      onSubmitHandler: () {
                        print('Send Request');
                      },
                    ),
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
