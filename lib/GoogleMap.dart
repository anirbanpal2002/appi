import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:http/http.dart' as http;

class Google extends StatefulWidget {
  const Google({Key? key, required this.lat, required this.lon})
      : super(key: key);

  final double lat;
  final double lon;

  @override
  State<Google> createState() => _GoogleState();
}

class _GoogleState extends State<Google> {
  static const String API = "AIzaSyAxqPetGXuVQvQkDGir9ehqQoGQHfAQ1AY";
  String originPlaceID = "";
  String destinationPlaceID = "";
  bool origin = false;
  bool destination = false;

  late GoogleMapController mapController;
  final Set<Polyline> _polyline = <Polyline>{};
  List<LatLng> polylineCoordinates1 = [];
  List<LatLng> polylineCoordinates2 = [];
  List<LatLng> polylineCoordinates3 = [];

  late Uri urlOrigin;
  late Uri urlDestination;

  Future<void> getData() async {
    urlOrigin = Uri(
        scheme: "https",
        host: "maps.googleapis.com",
        path: "/maps/api/geocode/json",
        queryParameters: {"latlng": "22.622508, 88.443714", "key": API});
    urlDestination = Uri(
        scheme: "https",
        host: "maps.googleapis.com",
        path: "/maps/api/geocode/json",
        queryParameters: {"latlng": "22.577721, 88.477092", "key": API});

    print(urlOrigin);
    print(urlDestination);
    // http.Response response1 = await http.get(urlOrigin);
    http.Response response2 = await http.get(urlDestination);

    /*if (response1.statusCode == 200) {
      origin = true;
      String data = response1.body;
      originPlaceID = jsonDecode(data)['results'][0]['place_id'];
      print(originPlaceID);
    } else {
      print(response1.statusCode);
    }*/
    if (response2.statusCode == 200) {
      destination = true;
      String data = response2.body;
      destinationPlaceID = jsonDecode(data)['results'][0]['place_id'];
      print(destinationPlaceID);
    } else {
      print(response2.statusCode);
    }
  }

  Future<void> getDirection() async {
    await getData();
    if (true) {
      print(widget.lat);
      print(widget.lon);
      final Uri urlDirection = Uri(
          scheme: "https",
          host: "maps.googleapis.com",
          path: "/maps/api/directions/json",
          queryParameters: {
            //"origin": "place_id:" + originPlaceID,
            "origin": "${widget.lat},${widget.lon}",
            "destination": "place_id:" + destinationPlaceID,
            //"origin":widget.lon,
            //"destination":widget.,
            "mode": "driving",
            "avoid": "tolls|highways|ferries",
            "key": API
          });
      print(urlDirection);
      http.Response response = await http.get(urlDirection);
      if (response.statusCode == 200) {
        String data = response.body;
        for (int i = 0; i < 1; i++) {
          if (jsonDecode(data)["geocoded_waypoints"][i]["geocoder_status"] ==
              "OK") {
            double lat = jsonDecode(data)["routes"][0]["legs"][i]
                ["start_location"]["lat"];
            double lng = jsonDecode(data)["routes"][0]["legs"][i]
                ["start_location"]["lng"];

            if (i == 0) {
              polylineCoordinates1.add(LatLng(lat, lng));
            } else if (i == 1) {
              polylineCoordinates2.add(LatLng(lat, lng));
            } else if (i == 2) {
              polylineCoordinates3.add(LatLng(lat, lng));
            }
            int polylineTotal = 0;
            for (var steps in jsonDecode(data)["routes"][0]["legs"][i]
                ["steps"]) {
              String step = jsonEncode(steps);
              /*double lat = jsonDecode(step)["end_location"]["lat"];
              double lng = jsonDecode(step)["end_location"]["lng"];
              int poly = jsonDecode(step)["duration"]["value"];
              polylineTotal = polylineTotal + poly;*/
              String polylinePoints = jsonDecode(step)["polyline"]["points"];
              final List<List<num>> polyline = decodePolyline(polylinePoints);
              for (List<num> pairs in polyline) {
                lat = pairs[0] as double;
                lng = pairs[1] as double;
                if (i == 0) {
                  polylineCoordinates1.add(LatLng(lat, lng));
                } else if (i == 1) {
                  polylineCoordinates2.add(LatLng(lat, lng));
                } else if (i == 2) {
                  polylineCoordinates3.add(LatLng(lat, lng));
                }
              }
              _polyline.add(
                Polyline(
                  points: (i == 0)
                      ? polylineCoordinates1
                      : (i == 1)
                          ? polylineCoordinates2
                          : polylineCoordinates3,
                  width: 4 + (2 * i),
                  polylineId: PolylineId("Route " + i.toString() + ""),
                  color: (i == 0)
                      ? Colors.blue
                      : (i == 1)
                          ? Colors.purpleAccent
                          : Colors.brown,
                ),
              );
            }
            print("\nPolyline Total : " + polylineTotal.toString());
          } else {
            print(response.statusCode);
          }
        }
      }
    }
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _polyline.clear();
    await getDirection();
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          polylines: _polyline,
          onMapCreated: _onMapCreated,
          compassEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          trafficEnabled: false,
          initialCameraPosition: const CameraPosition(
              target: LatLng(22.567579, 88.469023), zoom: 12.0),
        ),
      ),
    );
  }
}
