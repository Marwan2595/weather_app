// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/data/datasources/remote/weather_remote_datasource.dart'
    as _i27;
import '../features/data/repositories/weather_repo_impl.dart' as _i565;
import '../features/domain/repositories/weather_repo.dart' as _i543;
import '../features/domain/usecases/get_weather_usecase.dart' as _i27;
import '../features/presentation/controllers/weather_controller.dart' as _i588;
import 'api_handler.dart' as _i590;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i590.ApiHandler>(() => _i590.ApiHandler());
    gh.factory<_i27.WeatherRemoteDatasource>(
        () => _i27.WeatherRemoteDatasourceImpl(gh<_i590.ApiHandler>()));
    gh.factory<_i543.WeatherRepo>(() => _i565.WeatherRepoImpl(
        weatherRemoteDatasource: gh<_i27.WeatherRemoteDatasource>()));
    gh.factory<_i27.GetWeatherUseCase>(
        () => _i27.GetWeatherUseCase(weatherRepo: gh<_i543.WeatherRepo>()));
    gh.singleton<_i588.WeatherController>(
        () => _i588.WeatherController(gh<_i27.GetWeatherUseCase>()));
    return this;
  }
}
