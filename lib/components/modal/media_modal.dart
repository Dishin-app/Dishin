import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../tiles/modal_option_tile.dart';

Future<File> showMediaModal({@required context}) {
  //Variables
  final picker = ImagePicker();

  //Functions
  void getImage({@required ImageSource source}) async {
    var image = await picker.getImage(source: source, imageQuality: 50);

    Navigator.pop(context, File(image.path));
  }

  //Modal
  return showBarModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    expand: false,
    builder: (context, scrollController) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ModalOptionTile(
                color: Colors.black,
                icon: Icons.image,
                onPressed: () {
                  getImage(source: ImageSource.gallery);
                },
                title: 'Library'),
            ModalOptionTile(
                color: Colors.black,
                icon: Icons.camera,
                onPressed: () {
                  getImage(source: ImageSource.camera);
                },
                title: 'Camera'),
          ],
        ),
      );
    },
  );
}
