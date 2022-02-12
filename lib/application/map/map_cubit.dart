import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teker_teker/infrastructure/map_service/map_service.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  MapService service = MapService();

  void loadMarkers({double lat = 51.5, double long = -0.17}) async {
    emit(MapLoading());
    var markers = await service.getMarkers();
    emit(MapLoaded(markers));
  }
}
