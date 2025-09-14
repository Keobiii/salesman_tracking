import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  GoogleMapController? _mapController;

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(14.566575891892164, 121.08922372230174),
    tilt: 50.0,
    zoom: 14.0,
    bearing: 90,
  );

  void _goToQuezonCity() {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(14.6760, 121.0437), // 📍 Quezon City
          zoom: 14,
          tilt: 45,   // 📐 tilt for 3D effect
          bearing: 90, // ➡️ rotate east
        ),
      ),
    );
  }

    void _zoomIn() {
    _mapController?.animateCamera(CameraUpdate.zoomIn());
  }

  void _zoomOut() {
    _mapController?.animateCamera(CameraUpdate.zoomOut());
  }

  void _panRight() {
    _mapController?.animateCamera(CameraUpdate.scrollBy(100, 0));
  }

  void _panLeft() {
    _mapController?.animateCamera(CameraUpdate.scrollBy(-100, 0));
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (controller) => _mapController = controller,
            myLocationEnabled: true,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: _goToQuezonCity, child: const Text("Go QC")),
                ElevatedButton(onPressed: _zoomIn, child: const Text("Zoom In")),
                ElevatedButton(onPressed: _zoomOut, child: const Text("Zoom Out")),
                ElevatedButton(onPressed: _panLeft, child: const Text("← Left")),
                ElevatedButton(onPressed: _panRight, child: const Text("Right →")),
              ],
            ),
          )
        ],
      ),
    );
  }
}