import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapIntegration extends StatefulWidget {
  const GoogleMapIntegration({super.key});

  @override
  State<GoogleMapIntegration> createState() => _GoogleMapIntegrationState();
}

class _GoogleMapIntegrationState extends State<GoogleMapIntegration> {
  late GoogleMapController googleMapController;
  static const LatLng latLong = LatLng(24.916355, 79.581184);
  static const LatLng latLong2 = LatLng(24.918390, 79.591910);

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  Marker marker = Marker(
      markerId: const MarkerId("Chhatarpur"),
      position: latLong,
      infoWindow: const InfoWindow(title: "Chhatarpur"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));
  Marker marker2 = Marker(
      markerId: const MarkerId("Chhatarpur Mandir"),
      position: latLong2,
      infoWindow: const InfoWindow(title: "Chhatarpur Mandir"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Google Map",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            debugPrint("Back");
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Change the color of the arrow icon
          ),
        ),
      ),
      body: _getGoogleMap(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToIntel,
        label: const Text("Intel Corp"),
        icon: const Icon(Icons.place),
      ),
    );
  }

  static const CameraPosition intelPosition = CameraPosition(target: LatLng(28.550597,77.0980785), zoom: 14.780, bearing: 191.789, tilt: 34.89);
  Future<void> _goToIntel() async{
    final GoogleMapController controller = await googleMapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(intelPosition));

  }

  GoogleMap _getGoogleMap() {
    return GoogleMap(
        markers: {marker, marker2},
        mapType: MapType.hybrid,
        onMapCreated: onMapCreated,
        initialCameraPosition:
        const CameraPosition(target: latLong, zoom: 11));
  }


}
