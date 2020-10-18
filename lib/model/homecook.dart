import 'package:flutter/material.dart';

class Homecook {
  Homecook(
      {@required this.backgroundImage,
      @required this.name,
      @required this.profileImage,
      @required this.typeOfFood,
      this.distance});

  //Variables
  final String name;
  final String backgroundImage;
  final String profileImage;
  final String typeOfFood;
  final String distance;
}
