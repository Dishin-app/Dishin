import 'package:dishinapp/model/homecook.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import 'info_tile.dart';

class BusinessSummaryTile extends StatelessWidget {
  BusinessSummaryTile({@required this.homecook});

  //Variables
  final Color lineGrey = Colors.grey[200];
  final Homecook homecook;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '\$5.99',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'delivery fee',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: bottomNavGray,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 35,
                  color: lineGrey,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '25 min',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'delivery time',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: bottomNavGray,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0, left: 20),
            child: Container(
              height: 1,
              color: lineGrey,
            ),
          ),
          InfoTile(
              title: 'Type of Food',
              trailing: homecook.typeOfFood,
              onPressed: () {}),
          Padding(
            padding: EdgeInsets.only(right: 20.0, left: 20),
            child: Container(
              height: 1,
              color: lineGrey,
            ),
          ),
          InfoTile(title: 'Call', trailing: '(704) 123-4567', onPressed: () {})
        ],
      ),
    );
  }
}
