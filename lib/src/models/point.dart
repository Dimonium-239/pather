import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPoint {
  String id;
  LatLng latLng;
  String info;

  MapPoint({required this.id, required this.latLng, required this.info});
}