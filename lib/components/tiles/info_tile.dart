import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/device_size.dart';

class InfoTile extends StatelessWidget {
  //Constructor
  InfoTile(
      {@required this.title,
      @required this.trailing,
      @required this.onPressed,
      this.isPadded});

  //Variables
  final String title;
  final String trailing;
  final Function onPressed;
  final bool isPadded;

  @override
  Widget build(BuildContext context) {
    bool willAddPadding = isPadded ?? false;

    return Padding(
      padding: EdgeInsets.only(top: willAddPadding ? 0.0 : 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: Colors.white,
          width: DeviceSize().getWidth(context),
          constraints: BoxConstraints(minHeight: 55),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(trailing,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
