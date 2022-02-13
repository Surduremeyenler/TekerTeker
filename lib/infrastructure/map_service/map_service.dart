import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teker_teker/presentation/constants/constants.dart';

class MapService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Set<Marker>> getMarkers() async {
    var data = await firestore.collection('bicycles').doc('points').get();
    var markerLocations = <LatLng>[];
    for (var markers in data['markers']) {
      var lat = double.parse(markers['lat']);
      var long = double.parse(markers['long']);
      var latLng = LatLng(lat, long);

      markerLocations.add(latLng);
    }

    var markers = await _generateMarkers(positions: markerLocations);

    return markers;
  }

  Future<Set<Marker>> _generateMarkers(
      {required List<LatLng> positions}) async {
    var markers = <Marker>[];
    for (final location in positions) {
      var marker = await createMarker(
          location.latitude.toString(), location.longitude.toString());

      markers.add(marker!);
    }

    return markers.toSet();
  }

  Future<Uint8List?> getMarkerIcon(
      {required String url, int markerSize = 150}) async {
    try {
      var markerImageFile = await DefaultCacheManager().getSingleFile(url);
      var markerImageByte = await markerImageFile.readAsBytes();
      var markerImageCodec = await instantiateImageCodec(
        markerImageByte,
        targetWidth: markerSize,
        targetHeight: markerSize,
      );
      var frameInfo = await markerImageCodec.getNextFrame();
      var byteData = await frameInfo.image.toByteData(
        format: ImageByteFormat.png,
      );
      var resizedMarkerImageBytes = byteData?.buffer.asUint8List();
      return resizedMarkerImageBytes;
    } catch (e) {
      return null;
    }
  }

  Future<Marker?> createMarker(String lat, String long) async {
    Marker _marker;
    var markerIcon = await getMarkerIcon(
      url: biycleMarkerUrl,
    );

    _marker = Marker(
        markerId: MarkerId(lat),
        position: LatLng(double.parse(lat), double.parse(long)),
        icon: BitmapDescriptor.fromBytes(markerIcon!));

    return _marker;
  }
}
