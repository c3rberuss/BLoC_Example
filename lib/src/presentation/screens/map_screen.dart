import 'dart:async';

import 'package:blocexample/src/blocs/map/map_bloc.dart';
import 'package:blocexample/src/blocs/map/map_event.dart';
import 'package:blocexample/src/blocs/map/map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> markers;

  // ignore: close_sinks
  MapBloc _bloc;

  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    markers = Set<Marker>();
    _bloc = MapBloc();

    _bloc.add(GetLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MapBloc, MapState>(
        bloc: _bloc,
        builder: (BuildContext context, MapState state) {
          if (state is LocationObtainedState) {
            final camPosition = CameraPosition(
                //bearing: 192.8334901395799,
                target: state.coords,
                //tilt: 59.440717697143555,
                zoom: 19.151926040649414);

            final marker = Marker(
              markerId: MarkerId("my_location"),
              draggable: false,
              position: state.coords,
            );

            markers.add(marker);

            return GoogleMap(
              mapType: MapType.normal,
              markers: markers,
              compassEnabled: false,
              initialCameraPosition: camPosition,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _bloc.add(ChangeCameraPositionEvent());
        },
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }
}
