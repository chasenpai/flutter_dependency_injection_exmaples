import 'package:mask/domain/model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
}
