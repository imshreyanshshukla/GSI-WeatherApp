// Import necessary libraries for building the app UI and using GetX navigation
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import app specific color scheme definition
import 'package:weather_app/res/app_color.dart';

// Import the HomeScreen widget
import 'package:weather_app/view/home/home_screen.dart';

void main() {
  // Entry point of the application. Runs the app.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configure the GetMaterialApp widget which is the root widget
    // for this app using GetX navigation
    return GetMaterialApp(
      // Disable the debug banner displayed on top in debug builds
      debugShowCheckedModeBanner: false,
      // Set the application title displayed on the top bar
      title: 'G',
      // Define the application theme
      theme: ThemeData(
        // Create a color scheme based on a seed color and adjust brightness
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.defaultAppColor,
          brightness: Brightness.dark,
        ),
        // Enable Material 3 design language features
        useMaterial3: true,
        // Set the application font family
        fontFamily: 'Lato',
      ),
      // Set the home screen of the app
      home: const HomeScreen(),
    );
  }
}
