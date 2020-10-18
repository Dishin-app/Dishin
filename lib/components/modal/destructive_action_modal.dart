import 'package:dishinapp/components/tiles/modal_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<bool> showDestructiveActionModal(
    {@required context, @required String deleteTitle}) {
  //Modal
  return showBarModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (context, scrollController) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ModalOptionTile(
              color: Colors.red,
              icon: Icons.delete_forever,
              onPressed: () {
                Navigator.pop(context, true);
              },
              title: deleteTitle),
          ModalOptionTile(
              color: Colors.blue,
              icon: Icons.close,
              onPressed: () {
                Navigator.pop(context, false);
              },
              title: 'Cancel'),
        ],
      );
    },
  );
}
