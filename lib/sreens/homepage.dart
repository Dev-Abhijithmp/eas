import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eas/managedata/functionsandwidgets.dart';
import 'package:eas/managedata/getlocation.dart';
import 'package:eas/sreens/colorsandwidgetsfunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

bool isEnabled = false;

class _HomepageState extends State<Homepage> {
  List<Color> homecolor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  void changecolor(int index) {
    setState(() {
      homecolor[0] = Colors.white;
      homecolor[1] = Colors.white;
      homecolor[2] = Colors.white;
      homecolor[3] = Colors.white;
      homecolor[index] = Colors.red;
    });
  }

  void showfunctions() {
    setState(() {
      isEnabled = true;
    });
  }

  void hidefunctions() {
    setState(() {
      isEnabled = false;
    });
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Position p;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text("EAS"),
        backgroundColor: Colors.red,
      ),
      drawer: homedrawer(),
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<QuerySnapshot>(
                future: firestore.collection('fireforce').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData == true) {
                    List<DocumentSnapshot> data = snapshot.data!.docs;
                    return InkWell(
                      onTap: () async {
                        changecolor(0);
                        await [
                          Permission.sms,
                          Permission.location,
                          Permission.phone
                        ].request();
                        p = await determinePosition();
                        DocumentSnapshot result = await findnearest(data, p);
                        print(result.toString());
                        print(p.latitude.toString());
                        sendmessage(result.get('number'),
                            "Hi there, there is an emergency over here http://www.google.com/maps/place/${p.latitude},${p.longitude}");
                        makecall(result.get('number'));
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(60),
                          color: homecolor[0],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.local_fire_department_sharp),
                              Text(
                                "Fireforce",
                                style: GoogleFonts.signikaNegative(),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError == true) {
                    return buttonerror();
                  } else {
                    return buttonloading();
                  }
                }),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder<QuerySnapshot>(
                    future: firestore.collection('hospital').get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == true) {
                        List<DocumentSnapshot> data = snapshot.data!.docs;
                        return InkWell(
                          onTap: () async {
                            changecolor(1);
                            await [
                              Permission.sms,
                              Permission.location,
                              Permission.phone
                            ].request();
                            p = await determinePosition();
                            DocumentSnapshot result =
                                await findnearest(data, p);
                            print(result.toString());
                            print(p.latitude.toString());
                            sendmessage(result.get('number'),
                                "Hi there, a service request is raised from this location http://www.google.com/maps/place/${p.latitude},${p.longitude}");
                            makecall(result.get('number'));
                            ;
                          },
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(60),
                              color: homecolor[1],
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.medical_services_outlined),
                                  Text(
                                    "Ambulance",
                                    style: GoogleFonts.signikaNegative(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError == true) {
                        return buttonerror();
                      } else {
                        return buttonloading();
                      }
                    }),
                FutureBuilder<QuerySnapshot>(
                    future: firestore.collection('hospital').get(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == true) {
                        List<DocumentSnapshot> data = snapshot.data!.docs;
                        return InkWell(
                          onTap: () async {
                            changecolor(2);
                            await [
                              Permission.sms,
                              Permission.location,
                              Permission.phone
                            ].request();
                            p = await determinePosition();
                            DocumentSnapshot result =
                                await findnearest(data, p);
                            print(result.toString());
                            print(p.latitude.toString());
                            sendmessage(result.get('number'),
                                "Hi there, there is an emergency over here http://www.google.com/maps/place/${p.latitude},${p.longitude}");
                            makecall(result.get('number'));
                          },
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius: BorderRadius.circular(60),
                              color: homecolor[2],
                            ),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Emergency",
                                  style: GoogleFonts.signikaNegative(),
                                ),
                                Text(
                                  "Ambulance",
                                  style: GoogleFonts.signikaNegative(),
                                ),
                              ],
                            )),
                          ),
                        );
                      } else if (snapshot.hasError == true) {
                        return buttonerror();
                      } else {
                        return buttonloading();
                      }
                    }),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            FutureBuilder<QuerySnapshot>(
                future: firestore.collection('police').get(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData == true) {
                    List<DocumentSnapshot> data = snapshot.data!.docs;
                    return InkWell(
                      onTap: () async {
                        changecolor(3);
                        await [
                          Permission.sms,
                          Permission.location,
                          Permission.phone
                        ].request();
                        p = await determinePosition();
                        DocumentSnapshot result = await findnearest(data, p);
                        print(result.toString());
                        print(p.latitude.toString());
                        sendmessage(result.get('number'),
                            "Hi there, there is an emergency over here http://www.google.com/maps/place/${p.latitude},${p.longitude}");
                        makecall(result.get('number'));
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(60),
                          color: homecolor[3],
                        ),
                        child: Center(
                          child: Text(
                            "Police",
                            style: GoogleFonts.signikaNegative(),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError == true) {
                    return buttonerror();
                  } else {
                    return buttonloading();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
