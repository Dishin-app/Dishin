import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Navigation {
  void segue(
      {@required Widget page,
      @required BuildContext context,
      @required bool fullScreen}) {
    if (Platform.isIOS) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => page,
          fullscreenDialog: fullScreen,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => page, fullscreenDialog: fullScreen),
      );
    }
  }

  void segueToRoot(
      {@required Widget page,
      @required BuildContext context,
      @required bool fullScreen}) {
    if (Platform.isIOS) {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => page,
            fullscreenDialog: fullScreen,
          ),
          (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => page,
            fullscreenDialog: fullScreen,
          ),
          (Route<dynamic> route) => false);
    }
  }

  void fadeSegue(
      {@required Widget page,
      @required BuildContext context,
      @required bool segueToRoot}) {
    if (segueToRoot) {
      Navigator.pushAndRemoveUntil(
          context, FadeRoute(page: page), (Route<dynamic> route) => false);
    } else {
      Navigator.push(context, FadeRoute(page: page));
    }
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
