import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../marker_bloc/marker_bloc.dart';

// ignore: must_be_immutable
class MapScreen extends StatefulWidget {
  MapScreen(
      {super.key, required this.lat, required this.long, required this.userId});
  String lat;
  String long;
  String userId;
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  void getCurrentLocation() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref(widget.userId);

    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 100);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) async {
      await ref.set({
        "latitude": position.latitude.toString(),
        "longitude": position.longitude.toString(),
      });
      widget.lat = position.latitude.toString();
      widget.long = position.longitude.toString();
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MarkerBloc, MarkerState>(
        builder: (context, state) {
          Iterable<Marker> markerList =
              state.markerList.map((element) => Marker(
                    markerId: MarkerId(element.id),
                    position: LatLng(
                        double.parse(element.lat), double.parse(element.long)),
                  ));
          Set<Polyline> createPolylines() {
            Set<Polyline> polylines = <Polyline>{};

            for (var marker in markerList) {
              List<LatLng> polylineCoordinates = [
                LatLng(double.parse(widget.lat), double.parse(widget.long)),
                marker.position,
              ];

              Polyline polyline = Polyline(
                polylineId: PolylineId('polyline_${marker.markerId.value}'),
                color: Colors.red,
                width: 3,
                points: polylineCoordinates,
              );

              polylines.add(polyline);
            }

            return polylines;
          }

          return GoogleMap(
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target:
                  LatLng(double.parse(widget.lat), double.parse(widget.long)),
              zoom: 15,
            ),
            markers: Set<Marker>.of(markerList),
            polylines: createPolylines(),
            onCameraMove: (position) async {},
          );
        },
      ),
    );
  }
}
