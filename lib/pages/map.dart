import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  // Function to load JSON data from a file
  Future<String> loadJsonData() async {
    return await rootBundle.loadString('assets/location.json');
  }

  // Function to generate markers from JSON data MARKERS
  List<Marker> generateMarkersFromJson(String jsonData) {
    List<Marker> markers = [];

    // Parse JSON data

    Map<String, dynamic> data = json.decode(jsonData);
    List<dynamic> route1Markers = data['locations']['route1'];

    // Iterate through JSON data and create markers
    for (int i = 0; i < route1Markers.length; i++) {
      double latitude = route1Markers[i]['latitude'];
      double longitude = route1Markers[i]['longitude'];
      //String title = route1Markers[i]['title'];
      markers.add(
        Marker(
          point: LatLng(latitude, longitude),
          width: 40,
          height: 40,
          child: const Icon(Icons.location_pin),
        ),
      );
    }

    return markers;
  }

  List<LatLng> parseLocations(String jsonData) {
    final Map<String, dynamic> data = jsonDecode(jsonData);
    final List<dynamic> locations = data['locations']['route1'];

    List<LatLng> points = [];
    for (final location in locations) {
      points.add(LatLng(location['latitude'], location['longitude']));
    }
    return points;
  }

  List<Polyline> generatePolylinesFromJson(String jsonData) {
    final List<LatLng> points = parseLocations(jsonData); // Use parsed points

    return [
      Polyline(
        points: points, // Use all points for a single Polyline
        color: Colors.blue,
        strokeWidth: 4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: FutureBuilder(
            // Load JSON data asynchronously
            future: loadJsonData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error loading data');
              } else {
                // JSON data loaded successfully
                String jsonData = snapshot.data.toString();

                return FlutterMap(
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
                    PolylineLayer(
                      polylines: generatePolylinesFromJson(jsonData),
                    ),
                    MarkerLayer(
                      markers: generateMarkersFromJson(jsonData),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
