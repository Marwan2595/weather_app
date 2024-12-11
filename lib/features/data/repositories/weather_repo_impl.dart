import 'package:either_dart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/data/datasources/remote/weather_remote_datasource.dart';
import 'package:weather_app/features/data/models/error_model.dart';
import 'package:weather_app/features/data/models/weather_data_model.dart';
import 'package:weather_app/features/domain/repositories/weather_repo.dart';

@Injectable(as: WeatherRepo)
class WeatherRepoImpl implements WeatherRepo {
  final WeatherRemoteDatasource weatherRemoteDatasource;

  WeatherRepoImpl({required this.weatherRemoteDatasource});

  @override
  Future<Either<Failure, WeatherInfoModel>> getWeatherData(
      {required String searchText}) async {
    try {
      var result =
          await weatherRemoteDatasource.getWeatherData(searchText: searchText);
      return Right(result);
    } catch (e) {
      String error = e.toString().contains("No matching location")
          ? "City not found, Try correcting the city name"
          : e.toString();
      return Left(Failure(error));
    }
  }
}
