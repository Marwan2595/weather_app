import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/data/models/weather_data_model.dart';
import 'package:weather_app/features/domain/usecases/get_weather_usecase.dart';

@singleton
class WeatherController extends GetxController {
  final GetWeatherUseCase getWeatherUseCase;
  final currentWeatherInfoModel = Rxn<WeatherInfoModel>();
  WeatherController(
    this.getWeatherUseCase,
  );
  final isLoading = false.obs;

  Future<void> weatherSearch({required String cityName}) async {
    isLoading.value = true;
    var result = await getWeatherUseCase.call(searchText: cityName);
    result.fold((failure) {
      currentWeatherInfoModel.value = null;
      Get.snackbar(
        'Error',
        failure.errMessage,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    }, (weatherModel) {
      currentWeatherInfoModel.value = weatherModel;
    });
    isLoading.value = false;
  }
}
