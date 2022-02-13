import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String bottomNavBar1 = 'Harita';
const String bottomNavBar2 = 'Kredi';
const String bottomNavBar3 = 'Profil';

const CameraPosition initialCameraPosition =
    CameraPosition(target: LatLng(41.0, 28.9), zoom: 11);

const String mapfailText = 'Bulunduğun bölgede bisiklet bulamadık :(';
const String biycleMarkerUrl =
    'https://cdn-icons-png.flaticon.com/512/3198/3198344.png';

const defaultPadding = 16.0;

const kPrimaryColor = Color(0xFF2358A6);
const kGradientColor1 = Color(0xFF1C50A3);
const kGradientColor2 = Color.fromARGB(255, 131, 131, 131);
const kGradientColor3 = Color.fromARGB(255, 156, 156, 156);
const kGradientColor4 = Color.fromARGB(255, 156, 156, 156);
const kBodyColor = Color.fromARGB(255, 69, 69, 70);
const kAccentColor = Color(0xFFEE7943);
const kCardName = Color.fromARGB(255, 55, 57, 59);
const kIconsColor = Color(0xFF9B9DB4);

const kNumberTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.1,
);

const kSubTitlesStyle = TextStyle(
  color: Colors.grey,
  fontSize: 12,
);

