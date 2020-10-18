import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  String getUid() {
    final String uid = FirebaseAuth.instance.currentUser.uid;
    return uid;
  }

  Future<DocumentSnapshot> getProfileData({@required String uid}) {
    return FirebaseFirestore.instance.collection('users').doc(uid ?? '').get();
  }
}
