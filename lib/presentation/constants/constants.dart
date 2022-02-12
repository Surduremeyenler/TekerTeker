import 'package:google_maps_flutter/google_maps_flutter.dart';

const String bottomNavBar1 = 'Map';
const String bottomNavBar2 = 'Credits';
const String bottomNavBar3 = 'Profile';

const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(0, 0),zoom: 8);

const String mapfailText = 'Bulunduğun bölgede bisiklet bulamadık :(';