import 'package:dishinapp/screens/customer/homecooks/explore_homecooks.dart';
import 'package:dishinapp/screens/customer/orders/view_orders.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomerRoot extends StatefulWidget {
  @override
  _CustomerRootState createState() => _CustomerRootState();
}

class _CustomerRootState extends State<CustomerRoot> {
  //PageController
  PageController pageController = PageController(initialPage: 0);
  int pageIndex = 0;

  //Variables
  Color foodBankColor = dishinMainGreen;
  Color ordersColor = bottomNavGray;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //PageController
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[ExploreHomecooks(), ViewOrders()],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  changeTab(to: 0);
                },
                icon: Icon(
                  Icons.food_bank,
                  color: foodBankColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  changeTab(to: 1);
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: ordersColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Functions
  void changeTab({@required int to}) {
    resetColors();
    pageController.jumpToPage(to);

    //Change color of icon
    if (to == 0) {
      setState(() {
        foodBankColor = dishinMainGreen;
      });
    } else {
      setState(() {
        ordersColor = dishinMainGreen;
      });
    }
  }

  void resetColors() {
    foodBankColor = bottomNavGray;
    ordersColor = bottomNavGray;
  }
}
