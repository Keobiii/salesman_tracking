import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salesman_tracking/constant/user_location.dart';
import 'package:salesman_tracking/model/user_location_model.dart';


Future<Set<Marker>> buildUserMarkers(List<UserLocationModel> users) async {
  Set<Marker> markers = {};

  for (var userLocation in users) {
    final customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(122, 122)),
      userLocation.marker, 
    );

    markers.add(
      Marker(
        markerId: MarkerId(userLocation.user.id),
        position: LatLng(userLocation.latitude, userLocation.longitude),
        infoWindow: InfoWindow(
          title: "${userLocation.user.firstName} ${userLocation.user.lastName}",
          snippet: "@${userLocation.user.username}",
        ),
        icon: customIcon,
      ),
    );
  }

  return markers;
}



class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  late BitmapDescriptor customIcon;
  late CameraPosition _initialPosition;


  // Set<Circle> _circles = {
  //   Circle(
  //     circleId: CircleId("area"),
  //     center: LatLng(14.5995, 120.9842),
  //     radius: 500, // in meters
  //     fillColor: Colors.blue.withOpacity(0.3),
  //     strokeColor: Colors.blue,
  //     strokeWidth: 2,
  //   ),
  // };



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (userLocations.isNotEmpty) {
      final firstUser = userLocations[0];
      _initialPosition = CameraPosition(
        target: LatLng(firstUser.latitude, firstUser.longitude),
        tilt: 50,
        zoom: 14,
        bearing: 90
      );
    } else {
      _initialPosition = const CameraPosition(
        target: LatLng(14.5995, 120.9842), 
        zoom: 14,
      );
      
    }

    _loadUserMarkers();
  }

  Future<void> _loadUserMarkers() async {
    final markers = await buildUserMarkers(userLocations);
    setState(() {
      _markers = markers;
    });
  }

  // Future<void> _loadCustomMarker() async {
  //   customIcon = await BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(size: Size(64, 64)),
  //     "assets/marker/user1.png",
  //   );

  //   setState(() {
  //     _markers.add(
  //       Marker(
  //         markerId: const MarkerId("manila"),
  //         position: const LatLng(14.5995, 120.9842),
  //         infoWindow: const InfoWindow(
  //           title: "Manila",
  //           snippet: "Capital of the Philippines",
  //         ),
  //         icon: customIcon, 
  //       ),
  //     );
  //   });
  // }


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
            mapType: MapType.normal,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            compassEnabled: false,           
            mapToolbarEnabled: false,  
            markers: _markers,
            // onTap: _onMapTapped,
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 150, // card height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userLocations.length,
                itemBuilder: (context, index) {
                  final userLocation = userLocations[index];
                  return GestureDetector(
                    onTap: () {
                      // print("lat: " + userLocation.latitude.toString() + " long: " + userLocation.longitude.toString()); 

                      // set new camera position
                      _mapController?.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: LatLng(userLocation.latitude, userLocation.longitude),
                            zoom: 15,   
                            tilt: 45,  
                            bearing: 90,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.only(left: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Container(
                            width: 56, 
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: userLocation.user.status.color, 
                                width: 3,            
                              ),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                userLocation.user.avatar,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${userLocation.user.firstName} ${userLocation.user.lastName}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: userLocation.user.status.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${userLocation.user.status.status}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}