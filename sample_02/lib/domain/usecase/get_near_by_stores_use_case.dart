import 'package:injectable/injectable.dart';
import 'package:mask/domain/model/location.dart';
import 'package:mask/domain/model/permission.dart';
import 'package:mask/domain/model/store.dart';
import 'package:mask/domain/permission/location_permission_handler.dart';
import 'package:mask/domain/repository/location_repository.dart';
import 'package:mask/domain/repository/store_repository.dart';

@singleton
class GetNearByStoresUseCase {
  final StoreRepository _storeRepository;
  final LocationRepository _locationRepository;
  final LocationPermissionHandler _locationPermissionHandler;

  GetNearByStoresUseCase({
    required StoreRepository storeRepository,
    required LocationRepository locationRepository,
    required LocationPermissionHandler locationPermissionHandler,
  }) : _locationPermissionHandler = locationPermissionHandler,
       _locationRepository = locationRepository,
       _storeRepository = storeRepository;

  Future<List<Store>> execute() async {
    final stores = await _storeRepository.getStores();
    //기기 위치 서비스 확인
    final isServiceEnabled = await _locationPermissionHandler.isLocationServiceEnabled();
    //권한 체크
    if(isServiceEnabled) {
      var permission = await _locationPermissionHandler.checkPermission();
      if(permission == Permission.denied) {
        permission = await _locationPermissionHandler.requestPermission();
        if(permission == Permission.denied) {
          print('거부');
          return stores;
        }
      }
      if(permission == Permission.deniedForever) {
        print('두번 거부');
        return stores;
      }
      final location = await _locationRepository.getLocation();
      return stores.map((store) => store.copyWith(
        distance: location.distanceBetween(
          Location(
            store.lat,
            store.lng,
          ),
        ),
      )).toList()..sort((a, b) => a.distance.compareTo(b.distance));
    }
    return [];
  }
}
