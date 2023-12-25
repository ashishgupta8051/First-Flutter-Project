import 'dart:async';

import 'package:first_flutter_project/network/network.dart';
import 'package:first_flutter_project/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/feature_collection_data.dart';

class QuakeApp extends StatefulWidget {
  const QuakeApp({super.key});

  @override
  State<QuakeApp> createState() => _QuakeAppState();
}

class _QuakeAppState extends State<QuakeApp> {
  late Future<QuakeData> future;
  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _marketList = <Marker>[];
  double zoomValue = 5.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = Network.fetEarthQuakeData(Constant.quakeUrl);

    future.then((value) => {debugPrint(value.features.toString())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _getGoogleMap(context),
          _zoomMinus(),
          _zoomPlus(),

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _findQuakes,
        label: const Text("Find Quakes", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _getGoogleMap(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        markers: Set<Marker>.of(_marketList),
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition(
            target: LatLng(24.916355, 79.581184),
            zoom: 0,
            bearing: 191.789,
            tilt: 34.89),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Widget _zoomMinus() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            zoomValue--;
            _minus(zoomValue);
          },
          icon: const Icon(FontAwesomeIcons.searchMinus),
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _zoomPlus() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            zoomValue++;
            _plus(zoomValue);
          },
          icon: const Icon(FontAwesomeIcons.searchPlus),
          color: Colors.black87,
        ),
      ),
    );
  }


  void _findQuakes() {
    setState(() {
      _marketList.clear();
      _handleResponse();
    });
  }

  void _handleResponse() {
    setState(() {
      future.then((quakes) => {
            quakes.features.forEach((quakes) {
              _marketList.add(Marker(
                  markerId: MarkerId(quakes.id),
                  infoWindow: InfoWindow(
                      title: quakes.properties.mag.toString(),
                      snippet: quakes.properties.title),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueMagenta),
                  position: LatLng(quakes.geometry.coordinates[1],
                      quakes.geometry.coordinates[0]),
                  onTap: () {}));
            })
          });
    });
  }

  Future<void> _minus(double zoomValue) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: const LatLng(24.916355, 79.581184), zoom: zoomValue)));
  }
  
  Future<void> _plus(double zoomValue) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: const LatLng(24.916355, 79.581184), zoom: zoomValue)));
  }
}
