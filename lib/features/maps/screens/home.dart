import 'dart:async';

import 'package:engaze_task/features/maps/screens/map_screen.dart';
import 'package:engaze_task/features/marker_bloc/marker_bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../login/bloc/login_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String lat = '';
  String long = "";
  String locationMessage = "Current Location of the User";
  FirebaseDatabase database = FirebaseDatabase.instance;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnebled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnebled) {
      return Future.error("Location Services are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location Permission are permantly denied, we cannot request for permission");
    }

    return await Geolocator.getCurrentPosition(
        forceAndroidLocationManager: true);
  }

  @override
  void initState() {
    _getCurrentLocation();
    getlocation();
    super.initState();
  }

  void getlocation() async {
    locationMessage = "Latitude: $lat , Longitude: $long";

    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 100);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) async {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = "Latitude: $lat , Longitude: $long";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        context
            .read<MarkerBloc>()
            .add(GetMarkerDataEvent(userToken: state.user.userToken));
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home Screen"),
          ),
          body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(locationMessage),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapScreen(
                            lat: lat,
                            long: long,
                            userId: state.user.id,
                          ),
                        ));
                  },
                  child: const Text("open google Map"))
            ]),
          ),
        );
      },
    );
  }
}
