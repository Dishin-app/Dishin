import 'package:dishinapp/screens/intro/login.dart';
import 'package:dishinapp/screens/intro/sign_up.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: () {
              Navigation()
                  .segue(page: Login(), context: context, fullScreen: true);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Text(
              'Log in',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: DeviceSize().getWidth(context) * 0.1,
                left: DeviceSize().getWidth(context) * 0.1,
              ),
              child: Container(
                width: DeviceSize().getWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('images/dishin_logo.png')),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        'Homecooked.',
                        style: GoogleFonts.roboto(
                            fontSize: 45,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      'Delivered.',
                      style: GoogleFonts.roboto(
                          fontSize: 45,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Dishin.',
                      style: GoogleFonts.roboto(
                          fontSize: 45,
                          color: dishinMainGreen,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: Container(
                  width: DeviceSize().getWidth(context) * 0.75,
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {
                      Navigation().segue(
                          page: SignUp(), context: context, fullScreen: false);
                    },
                    color: dishinMainGreen,
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
