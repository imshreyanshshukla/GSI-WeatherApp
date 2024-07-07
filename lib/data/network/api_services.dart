// Import libraries for making network requests, handling JSON data,
// and custom exceptions
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/app_exceptions.dart';

// Import base class for network services (likely defines common logic)
import 'package:weather_app/data/network/base_api_services.dart';

// Import app specific URL definitions
import 'package:weather_app/res/app_url/app_url.dart';

class ApiServices extends BaseApiServices {
  // Fetches weather data based on latitude and longitude
  @override
  Future<dynamic> getWeatherApi(lan, lon) async {
    dynamic jsonData; // Stores the parsed JSON data

    try {
      // Make a GET request to the weather API endpoint with constructed URL
      var response = await http
          .get(Uri.parse(weatherAppUrl(lan, lon)))
          .timeout(const Duration(seconds: 20)); // Set a timeout of 20 seconds

      // Parse the response body as JSON
      jsonData = jsonResponse(response);
    } on SocketException {
      // Handle SocketException (no internet connection)
      throw InternetException('No Internet');
    } on RequestTimeOut {
      // Handle RequestTimeoutException (API request timed out)
      throw RequestTimeOut('Request Timeout');
    } catch (e) {
      // Catch any other unexpected exceptions
      rethrow; // Re-throw the exception for handling at a higher level
    }

    return jsonData;
  }

  // Parses the HTTP response and handles different status codes
  dynamic jsonResponse(http.Response response) {
    switch (response.statusCode) {
      case 200: // Success
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400: // Bad request (optional: handle specific error based on response body)
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse; // You might want to throw a specific exception here
      default:
        // Handle other unexpected status codes
        throw FetchDataException(
            'Error while Communication ${response.statusCode}');
    }
  }

  getWeatherApiByCityName(String cityName) {}
}
