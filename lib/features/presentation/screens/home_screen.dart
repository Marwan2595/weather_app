import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/config/app_dependencies.dart';
import 'package:weather_app/features/presentation/controllers/weather_controller.dart';
import 'package:weather_app/features/presentation/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  final searchTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = getIt.get<WeatherController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextFormField(
                  controller: searchTextController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Enter city name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter city name',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: IconButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await weatherController.weatherSearch(
                              cityName: searchTextController.text,
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => WeatherInfoBody(
                isLoading: weatherController.isLoading.value,
                weatherInfoModel:
                    weatherController.currentWeatherInfoModel.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
