import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishinapp/components/modal/media_modal.dart';
import 'package:dishinapp/components/spin_progress_indicator.dart';
import 'package:dishinapp/components/titles/text_field_title.dart';
import 'package:dishinapp/screens/customer/customer_root.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:dishinapp/utils/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';

class CustomerRegistration extends StatefulWidget {
  CustomerRegistration({Key key}) : super(key: key);

  @override
  _CustomerRegistrationState createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  //Variables
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController streetAddressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  bool isLoading = false;
  File profileImage;

  @override
  void dispose() {
    //Variables
    nameController.dispose();
    phoneNumberController.dispose();
    streetAddressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      progressIndicator: SpinProgressIndicator(),
      opacity: 0.5,
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                      pinned: true,
                      title: Text(
                        'Information',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )),
                  SliverToBoxAdapter(
                    child: Container(
                      width: DeviceSize().getWidth(context),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: DeviceSize().getWidth(context) * 0.1,
                          left: DeviceSize().getWidth(context) * 0.1,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 25.0),
                                  child: GestureDetector(
                                    onTap: () async {
                                      File image = await showMediaModal(
                                          context: context);
                                      profileImage = image;
                                    },
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: profileImage != null
                                          ? FileImage(profileImage)
                                          : null,
                                    ),
                                  ),
                                ),
                                textFieldTitle(title: 'Name'),
                                TextField(
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.done,
                                  controller: nameController,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  cursorColor: Colors.blue,
                                  keyboardAppearance: Brightness.light,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                  ),
                                ),
                                textFieldTitle(title: 'Phone number'),
                                TextField(
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.done,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  cursorColor: Colors.blue,
                                  keyboardAppearance: Brightness.light,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                  ),
                                ),
                                textFieldTitle(title: 'Street address'),
                                TextField(
                                  keyboardType: TextInputType.streetAddress,
                                  controller: streetAddressController,
                                  textInputAction: TextInputAction.done,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  cursorColor: Colors.blue,
                                  keyboardAppearance: Brightness.light,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                  ),
                                ),
                                textFieldTitle(title: 'City'),
                                TextField(
                                  controller: cityController,
                                  textInputAction: TextInputAction.done,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                  cursorColor: Colors.blue,
                                  keyboardAppearance: Brightness.light,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    focusedBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Column(
                                          children: [
                                            textFieldTitle(title: 'State'),
                                            TextField(
                                              controller: stateController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                              cursorColor: Colors.blue,
                                              keyboardAppearance:
                                                  Brightness.light,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                focusedBorder:
                                                    new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          children: [
                                            textFieldTitle(title: 'Zip code'),
                                            TextField(
                                              controller: zipController,
                                              textInputAction:
                                                  TextInputAction.done,
                                              style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                              cursorColor: Colors.blue,
                                              keyboardAppearance:
                                                  Brightness.light,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                focusedBorder:
                                                    new UnderlineInputBorder(
                                                  borderSide: new BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
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
                        uploadInfo();
                      },
                      color: dishinMainGreen,
                      child: Text(
                        'Create an account',
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
      ),
    );
  }

  //Functions
  Future<void> uploadInfo() async {
    setState(() {
      FocusScope.of(context).unfocus();
      isLoading = true;
    });

    //Variables
    String imageUrl;
    String uid = User().getUid();

    //Firebase Storage
    if (profileImage != null) {
      final StorageReference storageRef =
          FirebaseStorage.instance.ref().child('users/$uid/profile_image.jpg');
      final StorageUploadTask uploadTask = storageRef.putFile(profileImage);
      final StorageTaskSnapshot completed = await uploadTask.onComplete;

      await completed.ref.getDownloadURL().then((url) {
        imageUrl = url;
      });
    }

    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'name': nameController.text ?? '',
      'profile_image': imageUrl ?? '',
      'phone_number': phoneNumberController.text ?? '',
      'street_address': streetAddressController.text ?? '',
      'city': cityController.text ?? '',
      'state': stateController.text ?? '',
      'zip': zipController.text ?? ''
    }).then((value) {
      setState(() {
        isLoading = false;
        Navigation().segueToRoot(
            page: CustomerRoot(), context: context, fullScreen: true);
      });
    });
  }

  void getImageCallback({File image}) {
    setState(() {
      profileImage = image;
    });
  }
}
