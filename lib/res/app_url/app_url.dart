// Import the API key definition from the app resources
import 'package:weather_app/res/app_url/api_key.dart';

// Function to construct the URL for fetching weather data
String weatherAppUrl(double lat, double lon) {
  // String variable to hold the constructed URL
  String url;

  // Build the URL string with placeholders for latitude, longitude, and API key
  // Units are set to metric by default
  url =
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric';

  // Return the constructed URL
  return url;
}
