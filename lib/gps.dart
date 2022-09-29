import 'package:appi/GoogleMap.dart';
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
  String latText = "k";
  String longText = "s";
  double lat = 0;
  double lon = 0;

  @override
  void initState() {
    super.initState();
    mylocation();
    setState(() {});
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
      lat = _locationData.latitude!.toDouble();
      latText = lat.toString();
      lon = _locationData.longitude!.toDouble();
      longText = lon.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Latitude : ",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              latText,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Longitude : ",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              longText,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  mylocation();
                });
              },
              child: const Text(
                "GET",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Google(lat: lat, lon: lon)));
              },
              child: const Text(
                "GET",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
