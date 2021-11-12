import 'dart:ui';

import 'package:eas/authentication/authenticate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Forgotpass extends StatefulWidget {
  Forgotpass({Key? key}) : super(key: key);

  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    TextEditingController controllerMail = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "E-MAIL ADDRESS",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextFormField(
                            controller: controllerMail,
                            decoration: InputDecoration(
                              focusedBorder: outbid(),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.red,
                              ),
                              border: outbid(),
                              enabledBorder: outbid(),
                              disabledBorder: outbid(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.red,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            sendpassreset(controllerMail.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              "Send reset email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 30,
              top: 30,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  size: 35,
                  color: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder outbid() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.white,
        style: BorderStyle.none,
      ));
}
