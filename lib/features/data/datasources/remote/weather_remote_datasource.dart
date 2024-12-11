import 'package:injectable/injectable.dart';
import 'package:weather_app/config/api_handler.dart';
import 'package:weather_app/features/data/models/weather_data_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherInfoModel> getWeatherData({required String searchText});
}

@Injectable(as: WeatherRemoteDatasource)
class WeatherRemoteDatasourceImpl extends WeatherRemoteDatasource {
  ApiHandler apiHandler;
  WeatherRemoteDatasourceImpl(this.apiHandler);

  @override
  Future<WeatherInfoModel> getWeatherData({required String searchText}) async {
    try {
      var data = await apiHandler.getWeatherData(searchText);
      if (data is ErrorApiResult) {
        throw Exception(data.message);
      } else {
        return WeatherInfoModel.fromJson(
            (data as SuccessApiResult).data as Map<String, dynamic>);
      }
    } catch (e) {
      rethrow;
    }
  }
}
