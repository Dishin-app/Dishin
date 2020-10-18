import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
