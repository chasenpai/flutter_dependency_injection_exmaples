import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mask/domain/model/location.dart';
import 'package:mask/domain/repository/location_repository.dart';

@dev
@Singleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {

  @override
  Future<Location> getLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return Location(position.latitude, position.longitude);
  }
}