import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapState extends Equatable {
  const MapState();
}

class InitialMapState extends MapState {
  @override
  List<Object> get props => [];
}

class LoadingLocationState extends MapState {
  @override
  List<Object> get props => [];
}

class LocationObtainedState extends MapState {
  final LatLng coords;

  LocationObtainedState(this.coords);

  @override
  List<Object> get props => [coords];
}
