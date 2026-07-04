import 'package:latlong2/latlong.dart';

class DangerModel {
  final String title;
  final String type;
  final LatLng location;

  DangerModel({
    required this.title,
    required this.type,
    required this.location,
  });
}