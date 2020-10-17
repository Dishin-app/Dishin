import 'package:dishinapp/screens/intro/landing.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Container(
                  height: 55,
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigation().segueToRoot(
                          page: Landing(), context: context, fullScreen: true);
                    },
                    trailing: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
