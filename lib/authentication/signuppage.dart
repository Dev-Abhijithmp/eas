import 'package:eas/admin/add_data.dart';
import 'package:eas/authentication/authenticate.dart';
import 'package:eas/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Signuppage extends StatefulWidget {
  Signuppage({Key? key}) : super(key: key);

  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    TextEditingController controllerMail = TextEditingController();
    TextEditingController controllerPass = TextEditingController();
    TextEditingController controllerPass1 = TextEditingController();
    TextEditingController controllername = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 6, 59, 1),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
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
                        "Name",
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
                          controller: controllername,
                          decoration: InputDecoration(
                            focusedBorder: outbid(),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.person,
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
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
                          controller: controllerPass,
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
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "VERIFY PASSWORD",
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
                          controller: controllerPass1,
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
                Material(
                  color: Colors.red,
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () async {
                      if (controllername.text == "" ||
                          controllerMail.text == "" ||
                          controllerPass1.text == "") {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => alert(context));
                      }
                      if (controllerPass.text == controllerPass1.text) {
                        int flag = await register(controllerMail.text,
                            controllerPass.text, controllername.text);
                        if (flag == 0) {
                          Navigator.pop(context);
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  failed(context));
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                passmatch(context));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 25,
            child: Text(
              "Register",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

AlertDialog passmatch(context) {
  return AlertDialog(
    content: Text("password did'nt match"),
    actions: [
      TextButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },
      )
    ],
  );
}
