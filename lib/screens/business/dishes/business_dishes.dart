import 'package:dishinapp/components/tiles/product_tile.dart';
import 'package:dishinapp/screens/business/dishes/edit_dish.dart';
import 'package:dishinapp/screens/settings/settings.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessDishes extends StatefulWidget {
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
          SliverPadding(
            padding: EdgeInsets.only(top: 8),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index % 2 == 1) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(4, 8, 20, 0),
                  child: ProductTile(
                    onPressed: () {
                      Navigation().segue(
                          page: EditDish(),
                          context: context,
                          fullScreen: false);
                    },
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 4, 0),
                child: ProductTile(
                  onPressed: () {
                    Navigation().segue(
                        page: EditDish(), context: context, fullScreen: false);
                  },
                ),
              );
            }, childCount: 5),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: dishinMainGreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
