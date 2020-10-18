import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModalOptionTile extends StatelessWidget {
  //Constructor
  ModalOptionTile(
      {@required this.color,
      @required this.icon,
      @required this.onPressed,
      @required this.title});

  //Variables
  final String title;
  final IconData icon;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceSize().getWidth(context),
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
            height: 65,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontSize: 15, color: color, fontWeight: FontWeight.w600),
                ),
              ],
            )),
      ),
    );
  }
}
