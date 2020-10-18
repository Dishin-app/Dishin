import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishinapp/screens/customer/customer_registration.dart';
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
    });
  }

  login(
      {@required String email,
      @required String password,
      @required BuildContext context}) {}
}
