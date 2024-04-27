import 'package:injectable/injectable.dart';
import 'package:mask/domain/model/location.dart';
import 'package:mask/domain/model/permission.dart';
import 'package:mask/domain/model/store.dart';
import 'package:mask/domain/permission/location_permission_handler.dart';
import 'package:mask/domain/repository/location_repository.dart';
import 'package:mask/domain/repository/store_repository.dart';

@test
@Singleton(as: StoreRepository)
class MockStoreRepositoryImpl implements StoreRepository {

  @override
  Future<List<Store>> getStores() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      const Store(
        name: '부산 약국',
        address: 'address',
        lat: 1,
        lng: 1,
        remainStatus: 'remainStatus',
      ),
      const Store(
        name: '양산 약국',
        address: 'address',
        lat: 3,
        lng: 3,
        remainStatus: 'remainStatus',
      ),
      const Store(
        name: '울산 약국',
        address: 'address',
        lat: 2,
        lng: 2,
        remainStatus: 'remainStatus',
      ),
    ];
  }
}

@test
@Singleton(as: LocationRepository)
class MockLocationRepositoryImpl implements LocationRepository {

  @override
  Future<Location> getLocation() async {
    return Location(0, 0);
  }
}

@test
@Singleton(as: LocationPermissionHandler)
class MockLocationPermissionHandler implements LocationPermissionHandler {

  @override
  Future<Permission> checkPermission() async {
    return Permission.always;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return true;
  }

  @override
  Future<Permission> requestPermission() async {
    return Permission.always;
  }
}