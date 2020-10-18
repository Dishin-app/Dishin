import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dishinapp/components/spin_progress_indicator.dart';
import 'package:dishinapp/components/titles/text_field_title.dart';
import 'package:dishinapp/utils/auth.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:validators/validators.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //Variables
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    //Variables
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: SpinProgressIndicator(),
      opacity: 0.5,
      color: Colors.black,
      child: Scaffold(
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
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {},
                    keyboardAppearance: Brightness.light,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: new UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                  textFieldTitle(title: 'Password'),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    cursorColor: Colors.blue,
                    keyboardAppearance: Brightness.light,
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: new UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                  textFieldTitle(title: 'Confirm password'),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    controller: confirmPasswordController,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    cursorColor: Colors.blue,
                    keyboardAppearance: Brightness.light,
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: new UnderlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.blue, width: 2),
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
                          validate();
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
      ),
    );
  }

  //Functions
  void stopLoading() {
    setState(() {
      isLoading = false;
    });
  }

  void startLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void validate() {
    if (isEmail(emailController.text.trim())) {
      if (passwordController.text == confirmPasswordController.text) {
        if (confirmPasswordController.text.length >= 6) {
          Auth().signUpWithEmail(
              email: emailController.text,
              password: passwordController.text,
              stopLoading: stopLoading,
              startLoading: startLoading,
              context: context);
        } else {
          showOkAlertDialog(
              context: context,
              title: 'Error',
              message: 'Please make sure password is atleast 6 characters');
        }
      } else {
        showOkAlertDialog(
            context: context,
            title: 'Error',
            message: 'Please make sure passwords match');
      }
    } else {
      showOkAlertDialog(
          context: context,
          title: 'Error',
          message: 'Please enter valid email');
    }
  }
}
