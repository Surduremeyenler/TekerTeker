import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teker_teker/infrastructure/consts.dart';
import 'package:teker_teker/infrastructure/map_service.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final MapService mapService = MapService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mapService.getMarkers(),
        builder: (context, snapshot) {
          log('${snapshot.data}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                // GoogleMap(
                //   initialCameraPosition: initialCameraPosition,
                //   mapType: MapType.terrain,
                //   onMapCreated: (GoogleMapController controller) {
                //     _onMapCreated(controller);
                //   },
                // ),
              ],
            );
          } else {
            return Container();
          }
        });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }
}
