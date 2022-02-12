part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}
class MapLoading extends MapState {}
class MapLoaded extends MapState {
  final Set<Marker> markers;

  MapLoaded(this.markers);
}
