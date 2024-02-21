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
              center: LatLng(10.683082, 122.966510),
              zoom: 14.2,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://tile-{s}.openstreetmap.fr/hot/{z}/{x}/{y}.png',
                //urlTemplate:
                //    'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
                // urlTemplate:
                //  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: const [
                  'a',
                  'b',
                  'c'
                ], // Subdomains for load balancing
                userAgentPackageName: 'com.example.app',
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: const LatLng(
                        10.667177, 122.961227), // center of 't Gooi
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
                    point: LatLng(10.679, 122.962),
                    width: 40,
                    height: 40,
                    child: Icon(Icons.location_pin),
                  ),
                ],
              ),
              PolygonLayer(
                polygonCulling: false,
                polygons: [
                  Polygon(
                      points: [
                        const LatLng(10.682888, 122.957688),
                        const LatLng(10.684086, 122.960911),
                        const LatLng(10.680705, 122.962649),
                        const LatLng(10.679187, 122.959511),
                      ],
                      color: Colors.blue.withOpacity(0.5),
                      borderStrokeWidth: 2,
                      borderColor: Colors.blue,
                      isFilled: true),
                ],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      const LatLng(10.668328, 122.958444),
                      const LatLng(10.674155, 122.961091),
                      const LatLng(10.675039, 122.961242),
                      const LatLng(10.675847, 122.961027),
                      const LatLng(10.683639, 122.957072),
                      const LatLng(10.683985, 122.956504),
                    ],
                    color: Colors.green,
                    strokeWidth: 4,
                  ),
                ],
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(10.668328, 122.958444),
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.flag,
                      color: Color.fromARGB(255, 34, 224, 40),
                    ),
                  ),
                ],
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(10.683985, 122.956504),
                    width: 60,
                    height: 60,
                    child: Icon(
                      Icons.flag,
                      color: Color.fromARGB(255, 224, 34, 34),
                    ),
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
