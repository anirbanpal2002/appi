import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Gps extends StatefulWidget {
  const Gps({Key? key}) : super(key: key);

  @override
  State<Gps> createState() => _GpsState();
}

class _GpsState extends State<Gps> {
  // LocationData _locationData=LocationData();
  Location location = Location();

  @override
  void initState() {
    super.initState();
    mylocation();
  }

  Future<void> mylocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() async {
      _locationData = await location.getLocation();
    });
  }

  @override
  Future<Widget> build(BuildContext context) async {
    return Container(
      child: Text((await location.getLocation()).latitude.toString()),
    );
  }
}
