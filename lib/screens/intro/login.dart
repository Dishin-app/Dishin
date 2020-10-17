import 'package:dishinapp/components/titles/text_field_title.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Welcome back!',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          right: DeviceSize().getWidth(context) * 0.1,
          left: DeviceSize().getWidth(context) * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textFieldTitle(title: 'Email'),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (value) {},
                  keyboardAppearance: Brightness.light,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600, fontSize: 14),
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
                textFieldTitle(title: 'Password'),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600, fontSize: 14),
                  cursorColor: Colors.blue,
                  keyboardAppearance: Brightness.light,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                  ),
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: dishinAccentGreen),
                      )),
                ),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Center(
                  child: Container(
                    width: DeviceSize().getWidth(context) * 0.75,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {},
                      color: dishinMainGreen,
                      child: Text(
                        'Login',
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
      ),
    );
  }
}
