import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishinapp/screens/business/business_root.dart';
import 'package:dishinapp/screens/customer/customer_registration.dart';
import 'package:dishinapp/screens/customer/customer_root.dart';
import 'package:dishinapp/screens/intro/landing.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  signUpWithEmail({
    @required String email,
    @required String password,
    @required Function stopLoading,
    @required Function startLoading,
    @required BuildContext context,
  }) {
    startLoading();
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      FirebaseFirestore.instance.collection('users').doc(value.user.uid).set({
        'email': email,
        'created_on': DateTime.now().millisecondsSinceEpoch,
      }).then((value) {
        stopLoading();
        Navigation().segueToRoot(
            page: CustomerRegistration(), context: context, fullScreen: true);
      });
    }).catchError((error) {
      stopLoading();
      showOkAlertDialog(
          context: context,
          title: 'Error',
          message: 'Something is wrong with the credentials you provided');
    });
  }

  login(
      {@required String email,
      @required String password,
      @required Function stopLoading,
      @required Function startLoading,
      @required BuildContext context}) {
    startLoading();
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: email ?? '', password: password ?? '')
        .then((value) {
      stopLoading();
      redirectUser(uid: value.user.uid, context: context);
    }).catchError((error) {
      stopLoading();
      showOkAlertDialog(
          context: context,
          title: 'Error',
          message: 'Something is wrong with the credentials you provided');
    });
  }

  redirectUser({@required String uid, @required context}) {
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      final String role = value.data()['role'];
      if (role == 'UserType.Customer') {
        Navigation().segueToRoot(
            page: CustomerRoot(), context: context, fullScreen: true);
      } else if (role == 'UserType.Homecook') {
        Navigation().segueToRoot(
            page: BusinessRoot(), context: context, fullScreen: true);
      } else {
        Navigation().segueToRoot(
            page: CustomerRegistration(), context: context, fullScreen: true);
      }
    });
  }

  logout({@required BuildContext context}) {
    FirebaseAuth.instance.signOut().whenComplete(() {
      Navigation()
          .segueToRoot(page: Landing(), context: context, fullScreen: true);
    });
  }
}
