import 'package:dishinapp/components/tiles/order_tile.dart';
import 'package:dishinapp/screens/settings/settings.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewOrders extends StatefulWidget {
  ViewOrders({Key key}) : super(key: key);

  @override
  _ViewOrdersState createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'My Orders',
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return OrderTile();
              },
            ),
          )
        ],
      ),
    );
  }
}
