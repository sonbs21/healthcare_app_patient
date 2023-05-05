import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthcare_mobile/modules/doctor/doctor_controller.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});
  @override
  State<MapPage> createState() => _MapPageState();
}

var doctorController = Get.find<DoctorController>();

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  Position? _currentPosition;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          // onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(doctorController.currentPosition!.latitude,
                doctorController.currentPosition!.longitude),
            zoom: 11.0,
          ),
          markers: Set.from(doctorController.markers),
          myLocationEnabled: true),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {});
  }
}


