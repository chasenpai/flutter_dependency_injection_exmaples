import 'package:injectable/injectable.dart';
import 'package:mask/data/data_source/store_api.dart';
import 'package:mask/domain/model/store.dart';
import 'package:mask/domain/repository/store_repository.dart';

@dev
@Singleton(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  final _api = StoreApi();

  @override
  Future<List<Store>> getStores() async {
    final result = await _api.getStoreResult();
    if (result.stores == null) {
      return [];
    }
    return result.stores!
        .where((e) {
          return e.remainStat != null || e.stockAt != null;
        })
        .map((e) => Store(
              name: e.name ?? '',
              address: e.addr ?? '',
              lat: e.lat ?? 0.0,
              lng: e.lng ?? 0.0,
              remainStatus: e.remainStat!,
            ))
        .toList();
  }
}
