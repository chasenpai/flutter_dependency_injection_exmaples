// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mask/data/mock_datas.dart' as _i4;
import 'package:mask/data/permission/location_permission_handler_impl.dart'
    as _i9;
import 'package:mask/data/repository/location_repository_impl.dart' as _i8;
import 'package:mask/data/repository/store_repository_impl.dart' as _i6;
import 'package:mask/domain/permission/location_permission_handler.dart' as _i5;
import 'package:mask/domain/repository/location_repository.dart' as _i7;
import 'package:mask/domain/repository/store_repository.dart' as _i3;
import 'package:mask/domain/usecase/get_near_by_stores_use_case.dart' as _i10;
import 'package:mask/presentation/main_view_model.dart' as _i11;

const String _test = 'test';
const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.StoreRepository>(
      () => _i4.MockStoreRepositoryImpl(),
      registerFor: {_test},
    );
    gh.singleton<_i5.LocationPermissionHandler>(
      () => _i4.MockLocationPermissionHandler(),
      registerFor: {_test},
    );
    gh.singleton<_i3.StoreRepository>(
      () => _i6.StoreRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i7.LocationRepository>(
      () => _i4.MockLocationRepositoryImpl(),
      registerFor: {_test},
    );
    gh.singleton<_i7.LocationRepository>(
      () => _i8.LocationRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i5.LocationPermissionHandler>(
      () => _i9.LocationPermissionHandlerImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i10.GetNearByStoresUseCase>(() => _i10.GetNearByStoresUseCase(
          storeRepository: gh<_i3.StoreRepository>(),
          locationRepository: gh<_i7.LocationRepository>(),
          locationPermissionHandler: gh<_i5.LocationPermissionHandler>(),
        ));
    gh.factory<_i11.MainViewModel>(
        () => _i11.MainViewModel(gh<_i10.GetNearByStoresUseCase>()));
    return this;
  }
}
