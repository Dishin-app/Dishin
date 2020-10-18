import 'package:dishinapp/components/custom_stepper.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderStatusTile extends StatefulWidget {
  //Constructor
  OrderStatusTile({@required this.isBusiness});

  //Variables
  final bool isBusiness;

  @override
  _OrderStatusTileState createState() => _OrderStatusTileState();
}

class _OrderStatusTileState extends State<OrderStatusTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 72,
            width: DeviceSize().getWidth(context),
            child: Theme(
              data: ThemeData(
                  canvasColor: Colors.white,
                  primaryColor: dishinMainGreen,
                  splashColor: Colors.transparent),
              child: CustomStepper(
                steps: [
                  Step(
                    title: Text(''),
                    content: Container(),
                    state: StepState.editing,
                    isActive: true,
                  ),
                  Step(
                    title: Text(
                      'Transporting',
                      style: GoogleFonts.roboto(),
                    ),
                    content: Container(),
                  ),
                  Step(
                    title: Text(
                      'Delivered',
                      style: GoogleFonts.roboto(),
                    ),
                    content: Container(),
                  ),
                ],
                type: StepperType.horizontal,
                controlsBuilder: (context, {onStepCancel, onStepContinue}) =>
                    Container(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.0, left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preparing food',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w900,
                      color: Colors.blue,
                      fontSize: 30),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Text(
                        widget.isBusiness ? 'Customer' : 'Homecook',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          widget.isBusiness
                              ? Faker().person.name()
                              : Faker().person.name(),
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      Text(
                        'Order ID',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '${Faker().randomGenerator.integer(99999)}',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      Text(
                        'Ordered',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '12 mins ago',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
