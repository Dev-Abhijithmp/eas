import 'package:eas/authentication/authenticate.dart';
import 'package:eas/authentication/loginpage.dart';
import 'package:eas/sreens/loadingpage.dart';
import 'package:eas/sreens/somethingwentwrong.dart';
import 'package:eas/switcher.dart';
import 'package:flutter/material.dart';

class Signinout extends StatefulWidget {
  const Signinout({Key? key}) : super(key: key);

  @override
  _SigninoutState createState() => _SigninoutState();
}

class _SigninoutState extends State<Signinout> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: changesign,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Somethingwentwrong();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Loadingpage();
        } else if (snapshot.hasData) {
          return Switcher();
        } else {
          return Loginpage();
        }
      },
    );
  }
}
