import 'package:dishinapp/components/tiles/dish_tile.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessDishes extends StatefulWidget {
  BusinessDishes({Key key}) : super(key: key);

  @override
  _BusinessDishesState createState() => _BusinessDishesState();
}

class _BusinessDishesState extends State<BusinessDishes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'My Dishes',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return DishTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
