import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: FlutterMap(
            options: const MapOptions(
              center: LatLng(10.6713, 122.9511),
              zoom: 14.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: const LatLng(10.6713, 122.9511), // center of 't Gooi
                    radius: 1000,
                    useRadiusInMeter: true,
                    color: Colors.red.withOpacity(0.3),
                    borderColor: Colors.red.withOpacity(0.7),
                    borderStrokeWidth: 2,
                  )
                ],
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(10.6713, 122.9511),
                    width: 80,
                    height: 80,
                    child: FlutterLogo(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
