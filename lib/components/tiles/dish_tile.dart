import 'package:dishinapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DishTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        height: 70,
        color: Colors.white,
        child: Center(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Colors.grey,
                height: 55,
                width: 55,
                child: Image.network(
                  'https://source.unsplash.com/1600x900/?mexican,food',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              'Food name',
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              '\$000.000',
              style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: dishinAccentGreen),
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
