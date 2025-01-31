import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider with ChangeNotifier {
  late GoogleMapController _mapController;
  final LatLng _boiseLatLng = const LatLng(43.6150, -116.2023);
  final LatLng _amsterdamLatLng = const LatLng(52.3676, 4.9041);

  GoogleMapController get mapController => _mapController;
  LatLng get boiseLatLng => _boiseLatLng;
  LatLng get amsterdamLatLng => _amsterdamLatLng;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }
}
