import 'package:flutter/material.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

showCartModal({@required context}) {
  //Modal
  return showBarModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (context, scrollController) {
      return Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              DeviceSize().getWidth(context) * 0.1,
              DeviceSize().getWidth(context) * 0.1,
              DeviceSize().getWidth(context) * 0.1,
              0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                      height: 65,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Food item',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 55,
                              width: 55,
                              child: Image.network(
                                'https://source.unsplash.com/1600x900/?mexican,food',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          trailing: Text(
                            '\$000.00',
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      Container(
                        height: 0.1,
                        color: Colors.grey,
                      ),
                      Container(
                        height: 65,
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Food item',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                height: 55,
                                width: 55,
                                child: Image.network(
                                  'https://source.unsplash.com/1600x900/?mexican,food',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            trailing: Text(
                              '\$000.00',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: 5,
              ),
              Column(
                children: [
                  Container(
                    height: 0.1,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery fee',
                              style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Total amount due',
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '\$000.00',
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Text(
                                '\$000.00',
                                style: GoogleFonts.roboto(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: dishinAccentGreen),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SafeArea(
                top: false,
                bottom: true,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0, top: 25.0),
                  child: Center(
                    child: Container(
                      width: DeviceSize().getWidth(context) * 0.75,
                      height: 45,
                      child: RaisedButton(
                        onPressed: () {},
                        color: transportingBlue,
                        child: Text(
                          'Pay',
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
    },
  );
}
