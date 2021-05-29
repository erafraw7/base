// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/api_service_factory.dart' as _i3;
import '../database/database_manager.dart' as _i4;
import '../repository/product/product_repository.dart' as _i5;
import '../ui/login/cubit/login_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApiServiceFactory>(() => _i3.ApiServiceFactory());
  gh.factory<_i4.DatabaseProvider>(() => _i4.DatabaseProvider());
  gh.lazySingleton<_i5.ProductRepository>(
      () => _i5.ProductRepositoryImpl(get<_i3.ApiServiceFactory>()));
  gh.factory<_i6.LoginCubit>(
      () => _i6.LoginCubit(get<_i5.ProductRepository>()));
  return get;
}
