import 'package:eas/admin/add_data.dart';
import 'package:eas/authentication/authenticate.dart';
import 'package:eas/authentication/forgot.dart';
import 'package:eas/authentication/signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
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
                          child: TextField(
                            enabled: true,
                            autofocus: true,
                            controller: controller1,
                            decoration: InputDecoration(
                              focusedBorder: outbid(),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PASSWORD",
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
                            enabled: true,
                            controller: controller2,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.red,
                              ),
                              border: outbid(),
                              enabledBorder: outbid(),
                              disabledBorder: outbid(),
                              focusedBorder: outbid(),
                              enabled: true,
                            ),
                          ),
                        )
                      ],
                    ),
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
                          onTap: () async {
                            if (controller1.text == "" ||
                                controller2.text == "") {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      alert(context));
                            } else {
                              int flag = await signinemail(
                                  controller1.text, controller2.text);
                              if (flag == 1) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        failed(context));
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              "login",
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
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Forgotpass();
                          }));
                        },
                        child: Text(
                          "FORGOTTEN PASSWORD?",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 25,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 105,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Signuppage();
                  }));
                },
                child: Text(
                  "CREATE A NEW ACCOUNT",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
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
        color: Colors.red,
        style: BorderStyle.none,
      ));
}
