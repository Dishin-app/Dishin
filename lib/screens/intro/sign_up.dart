import 'package:dishinapp/components/titles/text_field_title.dart';
import 'package:dishinapp/screens/customer/customer_registration.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sign up',
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
                textFieldTitle(title: 'Confirm password'),
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
                      onPressed: () {
                        Navigation().segueToRoot(
                            page: CustomerRegistration(),
                            context: context,
                            fullScreen: true);
                      },
                      color: dishinMainGreen,
                      child: Text(
                        'Create an account',
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
