import 'package:dishinapp/components/modal/destructive_action_modal.dart';
import 'package:dishinapp/components/tiles/info_tile.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/utils/device_size.dart';
import 'package:flutter/material.dart';

class EditDish extends StatefulWidget {
  @override
  _EditDishState createState() => _EditDishState();
}

class _EditDishState extends State<EditDish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundGray,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              onPressed: () async {
                final bool decision = await showDestructiveActionModal(
                    context: context,
                    deleteTitle: 'Delete item from inventory');
                print(decision);
              }),
        ],
      ),
      body: Container(
        width: DeviceSize().getWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: DeviceSize().getWidth(context) * 0.25,
                  width: DeviceSize().getWidth(context) * 0.25,
                  color: Colors.grey,
                  child: Image.network(
                    'https://source.unsplash.com/1600x900/?mexican,food',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: InfoTile(
                      title: 'Food name',
                      trailing: 'Marsala',
                      onPressed: () async {},
                    ),
                  ),
                  InfoTile(
                    title: 'Price',
                    trailing: '\$12.99',
                    onPressed: () async {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
