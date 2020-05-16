import 'package:equatable/equatable.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class GetLocationEvent extends MapEvent {
  @override
  List<Object> get props => [];
}

class ChangeCameraPositionEvent extends MapEvent {
  @override
  List<Object> get props => [];
}
