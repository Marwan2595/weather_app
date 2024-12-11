import 'package:flutter/material.dart';
import 'package:weather_app/features/data/models/weather_data_model.dart';
import 'package:weather_app/features/presentation/widgets/no_weather_body.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({
    Key? key,
    this.isLoading = false,
    this.weatherInfoModel,
  }) : super(key: key);
  final bool isLoading;
  final WeatherInfoModel? weatherInfoModel;
  String getWeatherImage(int? weatherCondition) {
    if (weatherCondition == null) return 'assets/clear.png';

    switch (weatherCondition) {
      case 1000:
        return 'assets/clear.png';
      case 1003:
      case 1006:
      case 1009:
        return 'assets/cloudy.png';
      case 1063:
      case 1153:
      case 1150:
      case 1180:
      case 1183:
      case 1186:
      case 1192:
        return 'assets/rainy.png';
      case 1066:
      case 1069:
      case 1072:
      case 1114:
      case 1117:
        return 'assets/snow.png';
      case 1087:
        return 'assets/thunderstorm.png';
      default:
        return 'assets/clear.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : weatherInfoModel == null
                  ? const NoWeatherBody()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          weatherInfoModel!.cityName ?? "No Name",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Column(
                          children: [
                            if (weatherInfoModel!.icon != null)
                              Image.network(
                                "https:${weatherInfoModel!.icon!}",
                              ),
                            Text(
                              "${(weatherInfoModel!.tempDegree).toString()}°C",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
