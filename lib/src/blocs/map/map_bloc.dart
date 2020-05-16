import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import './bloc.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => InitialMapState();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    if(event is GetLocationEvent){

      yield LoadingLocationState();

      final location = await Location.instance.getLocation();

      yield LocationObtainedState(LatLng(location.latitude, location.longitude));

    }else if(event is ChangeCameraPositionEvent){

      yield LoadingLocationState();
      await Future.delayed(Duration(seconds: 3));
      yield LocationObtainedState(LatLng(37.43296265331129, -122.08832357078792));

    }
  }
}
