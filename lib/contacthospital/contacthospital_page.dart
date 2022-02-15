import 'dart:async';
import 'dart:convert';
import 'package:doctor_online/data/error.dart';
import 'package:doctor_online/data/place_response.dart';
import 'package:doctor_online/data/result.dart';
import 'package:doctor_online/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactHospital extends StatefulWidget {
  const ContactHospital({Key? key}) : super(key: key);

  @override
  State<ContactHospital> createState() => _ContactHospitalState();
}



@override
class _ContactHospitalState extends State<ContactHospital> {
  static const String _API_KEY = 'AIzaSyB0e9705Yn35Br4PWUn0OfUNW89DAw7F-U';
  static const String baseUrl =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json';
  static double latitude = 6.9271;
  static double longitude = 79.8612;
  List<Marker> markers = <Marker>[];
  late Error error;
  late List<Result> places;

  late LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _myLocation = CameraPosition(
      target: LatLng(latitude, longitude), zoom: 12);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => searchNearby(latitude, longitude));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _myLocation,
        markers: Set<Marker>.of(markers),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  void searchNearby(double latitude, double longitude) async {
    final GoogleMapController controller = await _controller.future;
    Get.defaultDialog(
        title: "Loading Hospitals...",
        barrierDismissible: false,
        content: const CircularProgressIndicator());

    locationSettings = AndroidSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
      forceLocationManager: true,
      intervalDuration: const Duration(seconds: 10),
    );

    if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
      Geolocator.getPositionStream(locationSettings: locationSettings).listen(
              (Position? position) async {
                latitude=position!.latitude.toDouble();
                longitude=position.longitude.toDouble();
                controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(latitude,longitude),zoom: 12)));
                Uri url = Uri.parse(
                    '$baseUrl?key=$_API_KEY&location=$latitude,$longitude&radius=10000&keyword=hospitals');
                print(url.toString());

                final response = await http.get(url);

                if (response.statusCode == 200) {
                  final data = json.decode(response.body);
                  _handleResponse(data);
                } else {
                  Get.snackbar("Error", 'An error occurred getting places nearby');
                }
                Get.back();
          });
    }else{
      Get.snackbar("Error", "Turn on location services");
      Get.offAndToNamed(Routes.home);
    }


  }

  void _handleResponse(data){
    // bad api key or otherwise
    if (data['status'] == "REQUEST_DENIED") {
      setState(() {
        error = Error.fromJson(data);
      });
      // success
    } else if (data['status'] == "OK") {
      setState(() {
        places = PlaceResponse.parseResults(data['results']);
        for (int i = 0; i < places.length; i++) {
          markers.add(
            Marker(
              markerId: MarkerId(places[i].placeId),
              position: LatLng(places[i].geometry.location.lat,
                  places[i].geometry.location.long),
              infoWindow: InfoWindow(
                  title: places[i].name, snippet: places[i].vicinity),
              onTap: () async {
              },
            ),
          );
        }
      });
    } else {
      print(data);
    }
  }
}
