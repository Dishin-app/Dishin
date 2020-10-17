import 'package:dishinapp/components/titles/text_field_title.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerRegistration extends StatefulWidget {
  CustomerRegistration({Key key}) : super(key: key);

  @override
  _CustomerRegistrationState createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                    pinned: true,
                    title: Text(
                      'Information',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )),
                SliverToBoxAdapter(
                  child: Container(
                    width: DeviceSize().getWidth(context),
                    child: Padding(
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
                              Padding(
                                padding: EdgeInsets.only(top: 25.0),
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              textFieldTitle(title: 'Name'),
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
                                    borderSide: new BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                ),
                              ),
                              textFieldTitle(title: 'Phone number'),
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
                                    borderSide: new BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                ),
                              ),
                              textFieldTitle(title: 'Street address'),
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
                                    borderSide: new BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                ),
                              ),
                              textFieldTitle(title: 'City'),
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
                                    borderSide: new BorderSide(
                                        color: Colors.blue, width: 2),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Column(
                                        children: [
                                          textFieldTitle(title: 'State'),
                                          TextField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.done,
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                            cursorColor: Colors.blue,
                                            keyboardAppearance:
                                                Brightness.light,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              focusedBorder:
                                                  new UnderlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        children: [
                                          textFieldTitle(title: 'Zip code'),
                                          TextField(
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            textInputAction:
                                                TextInputAction.done,
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14),
                                            cursorColor: Colors.blue,
                                            keyboardAppearance:
                                                Brightness.light,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              focusedBorder:
                                                  new UnderlineInputBorder(
                                                borderSide: new BorderSide(
                                                    color: Colors.blue,
                                                    width: 2),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0, top: 20.0),
              child: Center(
                child: Container(
                  width: DeviceSize().getWidth(context) * 0.75,
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {},
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
    );
  }
}
