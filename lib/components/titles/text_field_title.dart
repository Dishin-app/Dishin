import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textFieldTitle({@required String title}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Text(title,
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600, fontSize: 12, color: Colors.grey)),
    ),
  );
}
