import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eas/admin/adminhome.dart';
import 'package:eas/sreens/homepage.dart';
import 'package:eas/sreens/loadingpage.dart';
import 'package:eas/sreens/somethingwentwrong.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  const Switcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return FutureBuilder<DocumentSnapshot>(
      future: firestore.collection('users').doc(user!.uid).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Somethingwentwrong();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Loadingpage();
        } else {
          DocumentSnapshot doc = snapshot.data;

          if (doc.get('role') == "admin") {
            return Adminpage();
          } else {
            return Homepage();
          }
        }
      },
    );
  }
}
