import 'package:geolocator/geolocator.dart';

class Location {
  final num latitude;
  final num longitude;
  Location(this.latitude, this.longitude);
}

extension DistanceBetween on Location {
  num distanceBetween(Location other) {
    return Geolocator.distanceBetween(
      latitude.toDouble(),
      longitude.toDouble(),
      other.latitude.toDouble(),
      other.longitude.toDouble(),
    );
  }
}