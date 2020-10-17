import 'package:dishinapp/screens/settings/settings.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreHomecooks extends StatefulWidget {
  ExploreHomecooks({Key key}) : super(key: key);

  @override
  _ExploreHomecooksState createState() => _ExploreHomecooksState();
}

class _ExploreHomecooksState extends State<ExploreHomecooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'Explore',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () {
                    Navigation().segue(
                        page: Settings(), context: context, fullScreen: true);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
