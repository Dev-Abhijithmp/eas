import 'package:eas/admin/add_data.dart';
import 'package:eas/admin/removedata.dart';
import 'package:eas/authentication/authenticate.dart';
import 'package:eas/sreens/colorsandwidgetsfunctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({Key? key}) : super(key: key);

  @override
  _AdminpageState createState() => _AdminpageState();
}

List<Color> adminhome = [
  white,
  white,
  white,
  white,
  white,
  white,
];

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    void chnagecolor(int index) {
      setState(() {
        adminhome[0] = white;
        adminhome[1] = white;
        adminhome[2] = white;
        adminhome[3] = white;
        adminhome[4] = white;
        adminhome[5] = white;
        adminhome[index] = blue;
      });
    }

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          "Admin",
          style: GoogleFonts.signikaNegative(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "fireforce",
            style: GoogleFonts.signikaNegative(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  chnagecolor(0);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "fireforce")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[0],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: blue)),
                  child: Center(
                    child: Text(
                      "Add",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  chnagecolor(1);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Removefromfirestore(category: "fireforce")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[1],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: blue)),
                  child: Center(
                    child: Text(
                      "remove",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Hospital",
            style: GoogleFonts.signikaNegative(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  chnagecolor(2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "hospital")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[2],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: blue)),
                  child: Center(
                    child: Text(
                      "Add",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  chnagecolor(3);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "hospital")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[3],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: blue)),
                  child: Center(
                    child: Text(
                      "remove",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "police",
            style: GoogleFonts.signikaNegative(),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  chnagecolor(4);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "police")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[4],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: blue)),
                  child: Center(
                    child: Text(
                      "Add ",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  chnagecolor(5);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Addtofirestore(category: "police")));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: adminhome[5],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: blue)),
                  child: Center(
                    child: Text(
                      "remove",
                      style: GoogleFonts.signikaNegative(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              signout();
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "logout",
                  style: GoogleFonts.signikaNegative(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
