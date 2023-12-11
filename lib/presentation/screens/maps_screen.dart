import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<LatLng> points = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: const MapOptions(
              initialZoom: 13,

              // agregamos las cordenadas del mapa desde google maps
              initialCenter: LatLng(2.4406618116401146, -76.6152732856669)),
          children: [
            TileLayer(
              urlTemplate: "https://Tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            // agregamos marcadores al mapa
            MarkerLayer(markers: [
              // marcador 1
              Marker(
                  point: LatLng(2.4230597740988045, -76.6156641993051),
                  width: 80,
                  height: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on),
                    color: Colors.cyanAccent,
                    iconSize: 45,
                  )),

              Marker(
                  point: LatLng(2.4419091232234327, -76.60610638121526),
                  width: 80,
                  height: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on),
                    color: Colors.green.shade500,
                    iconSize: 45,
                  ))
            ]),
            //añadimos las lineas en el mapa strokewidth
            PolylineLayer(
              polylines: [Polyline(points: points, color: Colors.black26, strokeWidth: 10)
              ],
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
