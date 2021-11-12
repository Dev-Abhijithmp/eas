import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Somethingwentwrong extends StatelessWidget {
  const Somethingwentwrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Something went wrong",
          style: GoogleFonts.signikaNegative(),
        ),
      ),
    );
  }
}
