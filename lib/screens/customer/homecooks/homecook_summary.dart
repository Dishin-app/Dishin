import 'package:dishinapp/components/modal/cart_modal.dart';
import 'package:dishinapp/components/modal/item_info_modal.dart';
import 'package:dishinapp/components/tiles/business_summary_tile.dart';
import 'package:dishinapp/components/tiles/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/colors.dart';
import '../../../utils/device_size.dart';

class HomecookSummary extends StatefulWidget {
  @override
  _HomecookSummaryState createState() => _HomecookSummaryState();
}

class _HomecookSummaryState extends State<HomecookSummary> {
  //Variables
  ScrollController scrollController = ScrollController();
  bool sliverCollapsed = false;
  String appBarTitle = '';
  String homecookName = 'Homecook Name';
  @override
  void initState() {
    //Functions
    dynamicAppBar();
    super.initState();
  }

  @override
  void dispose() {
    //Controller
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  expandedHeight: 200,
                  title: Text(
                    appBarTitle,
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  brightness: Brightness.dark,
                  backgroundColor: backgroundGray,
                  leading: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: sliverCollapsed ? Colors.black : Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: DeviceSize().getWidth(context),
                          height: 200 + MediaQuery.of(context).padding.top,
                          child: Image.network(
                            "https://source.unsplash.com/1600x900/?fish",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: DeviceSize().getWidth(context),
                          color: Colors.black.withOpacity(0.4),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  homecookName,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 8),
                ),
                SliverToBoxAdapter(
                  child: BusinessSummaryTile(),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    if (index % 2 == 1) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(4, 8, 20, 0),
                        child: ProductTile(
                          onPressed: () {
                            showItemInfoModal(context: context);
                          },
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.fromLTRB(20, 8, 4, 0),
                      child: ProductTile(
                        onPressed: () {
                          showItemInfoModal(context: context);
                        },
                      ),
                    );
                  }, childCount: 5),
                ),
                SliverPadding(padding: EdgeInsets.all(50))
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.only(bottom: 25.0, top: 20.0),
              child: Center(
                child: Container(
                  width: DeviceSize().getWidth(context) * 0.75,
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {
                      showCartModal(context: context);
                    },
                    color: dishinMainGreen,
                    child: Text(
                      'Cart',
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
    );
  }

  //Functions
  void dynamicAppBar() {
    scrollController.addListener(() {
      if (scrollController.offset > 150 &&
          !scrollController.position.outOfRange) {
        if (!sliverCollapsed) {
          // do what ever you want when silver is collapsing !

          appBarTitle = homecookName;
          sliverCollapsed = true;
          setState(() {});
        }
      }
      if (scrollController.offset <= 150 &&
          !scrollController.position.outOfRange) {
        if (sliverCollapsed) {
          setState(() {
            appBarTitle = '';
            sliverCollapsed = false;
          });
        }
      }
    });
  }
}

class CustomerBusinessImages {}
