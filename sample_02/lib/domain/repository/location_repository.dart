import 'package:mask/domain/model/location.dart';

abstract interface class LocationRepository {
  Future<Location> getLocation();
}