import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/view/home/widgets/appbar_widget.dart';
import 'package:weather_app/view/home/widgets/current_temp_widget.dart';
import 'package:weather_app/view/home/widgets/footer_widget.dart';
import 'package:weather_app/view/home/widgets/info_widget.dart';
import 'package:weather_app/view_model/controller/global_controller.dart';

class HomeScreen extends StatefulWidget {
  // Constructor for HomeScreen
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Access the GlobalController using GetX dependency management
  final GlobalController globalController = Get.put(GlobalController());

  // Function to refresh data by calling getLocationAndFetchWeather() from GlobalController
  Future<void> _refreshData() async {
    await globalController.getLocationAndFetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Prevent the layout from adjusting based on soft keyboard
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator.adaptive(
        // Trigger _refreshData() on pull-to-refresh gesture
        onRefresh: _refreshData,
        child: Obx(
          // Rebuild whenever data in GlobalController changes
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child:
                      CircularProgressIndicator(), // Display progress indicator while loading
                )
              : Container(
                  // Set background gradient based on weather main condition from GlobalController using Utils.getBackgroundGradient()
                  decoration: BoxDecoration(
                    gradient: Utils.getBackgroundGradient(
                        globalController.weatherMain),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      // List of child widgets for the home screen
                      children: [
                        const AppbarWidget(), // Display location and date
                        const CurrentTempWidget(), // Display current temperature, weather icon, and description
                        const InfoWidget(), // Display additional weather information
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: globalController.searchController,
                                decoration: InputDecoration(
                                  hintText: 'Enter city name',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: globalController.searchWeatherByCity,
                                child: Text('Search Weather'),
                              ),
                              SizedBox(height: 20),
                              globalController.getWeatherModel().value != null
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'City: ${globalController.searchController.text}'),
                                        Text(
                                            'Temperature: ${globalController.currentTemperature()}°C'),
                                        Text(
                                            'Weather: ${globalController.weatherMain}'),
                                        // Add more weather details here...
                                      ],
                                    )
                                  : Text(
                                      'Enter a city name and search for weather.'),
                            ],
                          ),
                        ),
                        const FooterWidget(), // Display data source and last update time
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
