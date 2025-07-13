// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/weather/data/datasource/weather_local_data_source.dart'
    as _i0;
import '../../features/weather/data/datasource/weather_remote_data_source.dart'
    as _i289;
import '../../features/weather/data/repository/weather_repositories_impl.dart'
    as _i517;
import '../../features/weather/domain/repositories/weather_repository.dart'
    as _i956;
import '../../features/weather/domain/usecases/weather_usecase.dart' as _i195;
import '../../features/weather/presentation/cubit/weather_cubit.dart' as _i695;
import '../network/network_info.dart' as _i932;
import '../services/local_storage_service.dart' as _i527;
import '../services/network_service.dart' as _i463;
import 'dependency_injection.dart' as _i9;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final appModule = _$AppModule();
    gh.factory<_i361.Dio>(() => dioModule.dio);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharePreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i895.Connectivity>(() => appModule.connectivity);
    gh.factory<_i463.NetworkService>(() => _i463.DioService(gh<_i361.Dio>()));
    gh.lazySingleton<_i932.NetworkInfo>(
      () => appModule.provideNetworkInfo(gh<_i895.Connectivity>()),
    );
    gh.factory<_i527.LocalStorageService>(
      () => _i527.SharedPreferencesService(gh<_i460.SharedPreferences>()),
      instanceName: 'shared_preferences',
    );
    gh.factory<_i0.WeatherLocalDataSource>(
      () => _i0.WeatherLocalDataSourceImpl(
        gh<_i527.LocalStorageService>(instanceName: 'shared_preferences'),
      ),
    );
    gh.factory<_i289.WeatherDataSource>(
      () => _i289.WeatherDataSourceImpl(gh<_i463.NetworkService>()),
    );
    gh.factory<_i956.WeatherRepository>(
      () => _i517.WeatherRepositoryImpl(
        gh<_i289.WeatherDataSource>(),
        gh<_i0.WeatherLocalDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i195.GetWeatherUseCase>(
      () => _i195.GetWeatherUseCase(gh<_i956.WeatherRepository>()),
    );
    gh.factory<_i695.WeatherCubit>(
      () => _i695.WeatherCubit(gh<_i195.GetWeatherUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i9.DioModule {}

class _$SharedPreferencesModule extends _i9.SharedPreferencesModule {}

class _$AppModule extends _i9.AppModule {}
