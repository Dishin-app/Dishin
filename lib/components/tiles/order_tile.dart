import 'package:dishinapp/screens/customer/orders/order_details.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('John Paul',
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                  Text('2 hrs ago',
                      style:
                          GoogleFonts.roboto(fontSize: 15, color: Colors.grey))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Order #:',
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.grey)),
                        Text('23557',
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      children: [
                        Text('Total:',
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.grey)),
                        Text('\$12',
                            style: GoogleFonts.roboto(
                                fontSize: 15, fontWeight: FontWeight.w600))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      onPressed: () {
                        Navigation().segue(
                            page: OrderDetails(),
                            context: context,
                            fullScreen: false);
                      },
                      child: Text(
                        'Details',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: dishinAccentGreen),
                      ),
                      borderSide:
                          BorderSide(color: dishinMainGreen, width: 1.5),
                    ),
                    Text(
                      'Out for delivery',
                      style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: outForDeliveryBlue),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
