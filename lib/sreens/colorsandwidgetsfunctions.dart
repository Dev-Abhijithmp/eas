import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eas/authentication/authenticate.dart';
import 'package:eas/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Color red = Colors.red;
Color white = Colors.white;
Color blue = Colors.blue;
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Widget homedrawer() {
  return Drawer(
    child: FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                color: red,
                child: Center(
                  child: Text(
                    "EAS",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(firebaseAuth.currentUser!.uid)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData == true) {
                    DocumentSnapshot? data = snapshot.data;
                    return listitem(
                        context, "name", data!.get('name').toString());
                  } else {
                    return listitem(context, "name", "");
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              listitem(context, "Email", firebaseAuth.currentUser!.email),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: red,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  signout();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: red, borderRadius: BorderRadius.circular(18)),
                  child: Center(
                      child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              )
            ],
          );
        }),
  );
}

Widget buttonerror() {
  return Container(
    height: 120,
    width: 120,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(60),
        color: white),
    child: Center(
      child: Text("ERROR"),
    ),
  );
}

Widget buttonloading() {
  return Container(
    height: 120,
    width: 120,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(60),
        color: white),
    child: Center(
        child: CircularProgressIndicator(
      color: red,
      value: 3,
    )),
  );
}
