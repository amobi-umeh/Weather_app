class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({
    required this.description,
    required this.icon,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityname;
  final TemperatureInfo tempinfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({
    required this.cityname,
    required this.tempinfo,
    required this.weatherInfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityname = json['name'];
    final tempinfojson = json['main'];
    final tempinfo = TemperatureInfo.fromJson(tempinfojson);
    final weatherinfojson = json['weather'][0];
    final weatherinfo = WeatherInfo.fromJson(weatherinfojson);
    return WeatherResponse(
      cityname: cityname,
      tempinfo: tempinfo,
      weatherInfo: weatherinfo,
    );
  }
}
