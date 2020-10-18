import 'package:dishinapp/components/tiles/info_tile.dart';
import 'package:dishinapp/components/tiles/order_status_tile.dart';
import 'package:dishinapp/components/tiles/product_tile.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 35,
              ),
            ),
            title: Text(
              'Order Details',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: OrderStatusTile(
            isBusiness: false,
          )),
          SliverPadding(
            padding: EdgeInsets.only(top: 8),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: InfoTile(
                  title: 'Notes',
                  trailing: Faker().lorem.sentence(),
                  onPressed: () {}),
            ),
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
                    onPressed: () {},
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 4, 0),
                child: ProductTile(
                  onPressed: () {},
                ),
              );
            }, childCount: 5),
          ),
        ],
      ),
    );
  }
}
