// Import libraries for UI elements, geocoding, navigation (GetX), app constants, utilities, and the global controller
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/view_model/controller/global_controller.dart';

class AppbarWidget extends StatefulWidget {
  // Constructor for AppbarWidget
  const AppbarWidget({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  // State variable to store the retrieved city name
  String city = '';

  // Access the GlobalController using GetX dependency management
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    // Get the current location (latitude and longitude) from the GlobalController
    // and trigger address retrieval upon widget initialization
    getAddress(globalController.getLatitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  // Function to retrieve the address (city name) based on latitude and longitude
  Future<void> getAddress(double lat, double lon) async {
    // Use the geocoding package to get a list of placemarks for the given coordinates
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    // Extract the city name from the first placemark
    Placemark place = placemark[0];
    // Update the city state variable
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Align at top
        crossAxisAlignment: CrossAxisAlignment.start, // Align left
        children: [
          // Display the retrieved city name using a pre-defined text style
          Text(city, style: mediumTextStyle),
          // Display the formatted date using the Utils.date getter from the Utils class
          Text(
            Utils.date,
            style: lightTitleTextStyle,
          ),
        ],
      ),
    );
  }
}
