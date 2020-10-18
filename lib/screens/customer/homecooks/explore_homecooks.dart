import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dishinapp/components/spin_progress_indicator.dart';
import 'package:dishinapp/components/tiles/homecook_tile.dart';
import 'package:dishinapp/model/homecook.dart';
import 'package:dishinapp/utils/colors.dart';
import 'package:dishinapp/screens/settings/settings.dart';
import 'package:dishinapp/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

class ExploreHomecooks extends StatefulWidget {
  @override
  _ExploreHomecooksState createState() => _ExploreHomecooksState();
}

class _ExploreHomecooksState extends State<ExploreHomecooks> {
  //Variables
  List<Homecook> homecooks = [];
  bool isLoading = true;

  @override
  void initState() {
    getLocations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGray,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              'Explore',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: () {
                    Navigation().segue(
                        page: SettingsView(),
                        context: context,
                        fullScreen: true);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                        'https://source.unsplash.com/1600x900/?female,portrait'),
                  ),
                ),
              )
            ],
          ),
          isLoading
              ? SliverFillRemaining(
                  child: SpinProgressIndicator(
                    isDark: true,
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return HomecookTile(
                      homecook: homecooks[index],
                    );
                  }, childCount: homecooks.length),
                ),
        ],
      ),
    );
  }

  Future<void> getLocations() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    final geo = Geoflutterfire();
    final _firestore = FirebaseFirestore.instance;

    GeoFirePoint myLocation = geo.point(
        latitude: _locationData.latitude, longitude: _locationData.longitude);

    var collectionReference = _firestore.collection('homecooks');

    double radius = 15;
    String field = 'position';

    Stream<List<DocumentSnapshot>> stream = geo
        .collection(collectionRef: collectionReference)
        .within(center: myLocation, radius: radius, field: field);

    stream.first.then((value) {
      value.forEach((element) {
        Map<String, dynamic> data = element.data();
        homecooks.add(Homecook(
            backgroundImage: data['background_image'],
            name: data['name'],
            profileImage: data['profile_image'],
            typeOfFood: data['type_of_food'],
            distance: data['distance']));
      });

      setState(() {
        isLoading = false;
      });
    });
  }
}
