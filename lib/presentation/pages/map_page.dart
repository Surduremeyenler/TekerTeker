import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            //! Note:
            /* Map<String, dynamic> data =
                snapshot.data as Map<String, dynamic>;
            data["markers"][0]["type"] şeklinde kullanılabiliyor UI içinde. */

            if (snapshot.hasData) {
              return Center(
                child: Text("There are some datas."),
              );
            }
            /* Stack(
              children: [
               GoogleMap(
                 initialCameraPosition: initialCameraPosition,
                 mapType: MapType.terrain,
                 onMapCreated: (GoogleMapController controller) {
                   _onMapCreated(controller);
                 },
               ),
              ],
            ); */
          } else {
            return Container();
          }
          return Container();
        });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller.complete(controller);
    });
  }
}
