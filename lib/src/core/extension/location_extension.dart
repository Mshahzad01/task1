import 'package:google_maps_flutter/google_maps_flutter.dart';

extension LatLngFormat on LatLng {
  String get formatted => '${latitude.toStringAsFixed(3)}, ${longitude.toStringAsFixed(3)}';
}
