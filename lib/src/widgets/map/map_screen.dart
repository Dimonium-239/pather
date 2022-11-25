import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  final Location _location = Location();
  final LatLng _initialCameraPosition = const LatLng(52.237049, 21.017532);

  void _toCurrentLocation(){
    _location.getLocation().then((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(l.latitude ?? 0.0, l.longitude ?? 0.0),
              zoom: 15),
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
    _toCurrentLocation();
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: _initialCameraPosition, zoom: 15.0,),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          zoomControlsEnabled: false
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toCurrentLocation,
        child: const Icon(Icons.location_searching), //TODO: Make icon animated while searching new location
      ),
    );
  }
}
