import 'package:dishinapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinProgressIndicator extends StatelessWidget {
  SpinProgressIndicator({@required this.isDark});

  //Varibles
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: SpinKitDoubleBounce(
        color: isDark ? dishinMainGreen : Colors.white,
        size: 40,
      ),
    );
  }
}
