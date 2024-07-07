// This file defines an abstract base class for API services.
abstract class BaseApiServices {
  // This is an abstract method that must be implemented by subclasses.
  // It fetches weather data from an API based on latitude (lan) and longitude (lon).
  // It returns a Future containing the parsed data or throws an exception on error.
  Future<dynamic> getWeatherApi(var lan, var lon);
}
