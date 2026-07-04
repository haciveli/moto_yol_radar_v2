import '../widgets/danger_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import '../services/danger_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();

  LatLng _currentLocation = const LatLng(41.0082, 28.9784);

  Future<void> _goToCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    final userLocation = LatLng(
      position.latitude,
      position.longitude,
    );

    setState(() {
      _currentLocation = userLocation;
    });

    _mapController.move(userLocation, 16);
  }

  IconData _dangerIcon(String type) {
    switch (type) {
      case "hole":
        return Icons.warning;

      case "gravel":
        return Icons.scatter_plot;

      case "water":
        return Icons.water_drop;

      case "roadwork":
        return Icons.construction;

      default:
        return Icons.location_on;
    }
  }

  Color _dangerColor(String type) {
    switch (type) {
      case "hole":
        return Colors.red;

      case "gravel":
        return Colors.orange;

      case "water":
        return Colors.blue;

      case "roadwork":
        return Colors.amber;

      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: FlutterMap(
  mapController: _mapController,
  options: MapOptions(
    initialCenter: _currentLocation,
    initialZoom: 13,
    onLongPress: (tapPosition, point) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return DangerBottomSheet(
            onSelected: (type, title) {
              Navigator.pop(context);
            },
          );
        },
      );
    },
  ),
  children: [
          TileLayer(
            urlTemplate:
                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.motoyolradar.app",
          ),

          /// Kullanıcının Konumu
          MarkerLayer(
            markers: [
              Marker(
                point: _currentLocation,
                width: 45,
                height: 45,
                child: const Icon(
                  Icons.my_location,
                  color: Colors.blue,
                  size: 40,
                ),
              ),

              /// Tehlikeler
             ...DangerService.dangers.map(
                (danger) => Marker(
                  point: danger.location,
                  width: 45,
                  height: 45,
                  child: Icon(
                    _dangerIcon(danger.type),
                    color: _dangerColor(danger.type),
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _goToCurrentLocation,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}