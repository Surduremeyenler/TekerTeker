import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Set<Marker>> getMarkers() async {
    var data = await firestore
        .collection('bicycles')
        .doc("points")
        .get();
       var markers = await generateMarkers(positions: []); // TODO latlong
        return markers;
  }
  
  Future<Set<Marker>> generateMarkers({required List<LatLng> positions}) async {
    var markers = <Marker>[];
    for (final location in positions) {
      final icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(24, 24)), 'assets/bike.png');

      final marker = Marker(
        markerId: MarkerId(location.toString()),
        position: LatLng(location.latitude, location.longitude),
        icon: icon,
      );

      markers.add(marker);
    }

    return markers.toSet();
  }
}