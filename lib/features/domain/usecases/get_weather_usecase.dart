import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/data/models/error_model.dart';
import 'package:weather_app/features/data/models/weather_data_model.dart';
import 'package:weather_app/features/domain/repositories/weather_repo.dart';

@injectable
class GetWeatherUseCase {
  final WeatherRepo weatherRepo;
  GetWeatherUseCase({required this.weatherRepo});
  Future<Either<Failure, WeatherInfoModel>> call({required String searchText}) {
    return weatherRepo.getWeatherData(searchText: searchText);
  }
}
