class WeatherInfoModel {
  final String? cityName;
  final String? weatherCondition;
  final double? tempDegree;
  final String? icon;

  WeatherInfoModel({
    this.cityName,
    this.weatherCondition,
    this.tempDegree,
    this.icon,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    final location = json['location'] as Map<String, dynamic>;
    final current = json['current'] as Map<String, dynamic>;
    final condition = current['condition'] as Map<String, dynamic>;

    return WeatherInfoModel(
      cityName: location['name'] ?? "",
      weatherCondition: condition['code']?.toString() ?? "",
      tempDegree: current['temp_c']?.toDouble() ?? 0.0,
      icon: condition['icon']?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'weatherCondition': weatherCondition,
      'tempDegree': tempDegree,
      'icon': icon,
    };
  }

  @override
  String toString() {
    return 'WeatherInfo(cityName: $cityName, weatherCondition: $weatherCondition, '
        'tempDegree: $tempDegree, icon: $icon)';
  }
}
