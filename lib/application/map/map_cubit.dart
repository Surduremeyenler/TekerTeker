import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teker_teker/infrastructure/map_service/map_service.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  MapService service = MapService();

  void loadMarkers() async {
    emit(MapLoading());
    var markers = await service.getMarkers();
    var userLocation = await service.getUserPosition();
    emit(MapLoaded(markers,userLocation));
  }
}
