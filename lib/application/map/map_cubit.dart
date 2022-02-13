import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:teker_teker/infrastructure/map_service/map_service.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState.initial(isLoaded: false, isLoading: true, markers: <Marker>{}));

  MapService service = MapService();

  void loadMarkers() async {
    try {
      var markers = await service.getMarkers();
      emit(state.copyWith(isLoading: false, markers: markers, isLoaded: true));
    } catch (e) {
      print(e);
    }
  }
}
