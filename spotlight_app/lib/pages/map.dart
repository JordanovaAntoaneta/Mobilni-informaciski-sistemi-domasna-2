import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _boiseLatLng = const LatLng(43.6150, -116.2023);
  final LatLng _amsterdamLatLng = const LatLng(52.3676, 4.9041);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const customOrange = Color(0xFFF1B363);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spotlight', style: GoogleFonts.doHyeon(color: Colors.white, fontSize: 45)),
        automaticallyImplyLeading: false,
        backgroundColor: customOrange,
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white, size: 38,),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _boiseLatLng,
          zoom: 3,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('boise'),
            position: _boiseLatLng,
            infoWindow: const InfoWindow(title: 'Hamilton'),
          ),
          Marker(
            markerId: const MarkerId('amsterdam'),
            position: _amsterdamLatLng,
            infoWindow: const InfoWindow(title: 'The Eras Tour'),
          ),
        },
      ),
    );
  }
}
