import 'package:either_dart/either.dart';
import 'package:weather_app/features/data/models/error_model.dart';
import 'package:weather_app/features/data/models/weather_data_model.dart';

abstract class WeatherRepo {
  Future<Either<Failure, WeatherInfoModel>> getWeatherData(
      {required String searchText});
}
