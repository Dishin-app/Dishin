import 'package:dishinapp/components/tiles/info_tile.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

showItemInfoModal({@required context}) {
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
              InfoTile(title: 'Item', trailing: 'Food item', onPressed: () {}),
              Container(
                height: 0.1,
                color: Colors.grey,
              ),
              InfoTile(
                  title: 'Ingredients',
                  trailing:
                      'Roasted peanuts, sugar, hydrogenated vegetable oil (Cottonseed, Soybean and Rapeseed Oil) to prevent separation, salt.',
                  onPressed: () {}),
              Container(
                height: 0.1,
                color: Colors.grey,
              ),
              InfoTile(title: 'Price', trailing: '\$000.00', onPressed: () {}),
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: transportingBlue,
                        child: Text(
                          'Add to order',
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
