import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teker_teker/application/map/map_cubit.dart';
import 'package:teker_teker/infrastructure/map_service/map_service.dart';
import 'package:teker_teker/presentation/constants/constants.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        if (state is MapLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          state as MapLoaded;
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: initialCameraPosition,
                mapType: MapType.terrain,
                markers: state.markers,
                onMapCreated: (GoogleMapController controller) {
                  _onMapCreated(controller);
                },
              ),
            ],
          );
        }
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    if (!_controller.isCompleted) {
      setState(() {
        _controller.complete(controller);
      });
    }
  }
}
