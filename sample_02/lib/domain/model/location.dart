class Location {
  final num latitude;
  final num longitude;
  Location(this.latitude, this.longitude);
}

extension DistanceBetween on Location {
  num distanceBetween(Location other) {
    return 0.0;
  }
}