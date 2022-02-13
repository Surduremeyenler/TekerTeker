part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial(
      {required bool isLoading,
      required bool isLoaded,
      required Set<Marker> markers}) = _Initial;
}
