import 'package:dishinapp/screens/customer/homecooks/homecook_summary.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/navigation.dart';

class HomecookTile extends StatelessWidget {
  //Constructor
  HomecookTile();

  //Variables

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation().segue(
            page: HomecookSummary(), context: context, fullScreen: false);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(
              height: 150,
              width: DeviceSize().getWidth(context),
              color: Colors.grey,
              child: Image.network(
                'https://source.unsplash.com/1600x900/?mexican,food',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 68,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      'https://source.unsplash.com/1600x900/?portrait'),
                ),
                title: Text(
                  Faker().person.name(),
                  style: GoogleFonts.roboto(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'Mexican food',
                  style: GoogleFonts.roboto(fontSize: 15, color: Colors.grey),
                ),
                trailing: Text('123 mi',
                    style:
                        GoogleFonts.roboto(fontSize: 15, color: Colors.grey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
