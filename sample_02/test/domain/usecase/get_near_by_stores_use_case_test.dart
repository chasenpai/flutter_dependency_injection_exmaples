import 'package:flutter_test/flutter_test.dart';
import 'package:mask/data/mock_datas.dart';
import 'package:mask/domain/usecase/get_near_by_stores_use_case.dart';

void main() {
  final useCase = GetNearByStoresUseCase(
    storeRepository: MockStoreRepositoryImpl(),
    locationRepository: MockLocationRepositoryImpl(),
    locationPermissionHandler: MockLocationPermissionHandler(),
  );
  test('약국 거리 오름차순 정렬', () async {
    final stores = await useCase.execute();
    expect(stores[0].name, '부산 약국');
    expect(stores[1].name, '울산 약국');
    expect(stores[2].name, '양산 약국');
  });
}