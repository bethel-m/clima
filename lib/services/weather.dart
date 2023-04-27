import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const appId = 'da42d10e54b6e3b4b0d87f9bfc9c436e';
const authority = 'api.openweathermap.org';
const unencodedPath = '/data/2.5/weather';
const units = 'metric';

class WeatherModel {
  double? latitude;
  double? longitude;
  getCityWeather(String city) async {
    var url = Uri.https(
      authority,
      unencodedPath,
      {
        'q': city,
        'appid': appId,
        'units': units,
      },
    );
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;
    var url = Uri.https(
      authority,
      unencodedPath,
      {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': appId,
        'units': units,
      },
    );
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int? temp) {
    if (temp != null && temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp != null && temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp != null && temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
