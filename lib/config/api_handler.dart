import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiHandler {
  static String baseUrl = 'https://api.weatherapi.com/v1/current.json';
  final String _apiKey = '00ecb459bdf54d33a77211634241012';

  var dio = Dio();
  Future<ApiResult> getWeatherData(String location) async {
    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {
          'key': _apiKey,
          'q': location,
        },
      );
      print("//////////////////////////////*****************************");
      print(response.data);
      return SuccessApiResult(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        return ErrorApiResult(e.response?.data['error']['message']);
      } else {
        return ErrorApiResult('Network error');
      }
    }
  }
}

class ApiResult {}

class SuccessApiResult extends ApiResult {
  dynamic data;
  SuccessApiResult(this.data);
}

class ErrorApiResult extends ApiResult {
  String message;
  ErrorApiResult(this.message);
}
