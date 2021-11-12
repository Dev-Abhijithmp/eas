import 'package:eas/sreens/colorsandwidgetsfunctions.dart';
import 'package:flutter/material.dart';

class Loadingpage extends StatefulWidget {
  Loadingpage({Key? key}) : super(key: key);

  @override
  _LoadingpageState createState() => _LoadingpageState();
}

class _LoadingpageState extends State<Loadingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: red,
          value: 4,
        ),
      ),
    );
  }
}
