import 'package:dishinapp/screens/business/dishes/business_dishes.dart';
import 'package:dishinapp/screens/business/orders/business_orders.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:flutter/material.dart';

class BusinessRoot extends StatefulWidget {
  @override
  _BusinessRootState createState() => _BusinessRootState();
}

class _BusinessRootState extends State<BusinessRoot> {
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
        children: <Widget>[BusinessOrders(), BusinessDishes()],
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
                  Icons.local_dining,
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
