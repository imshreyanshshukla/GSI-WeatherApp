// Import libraries for UI elements, app constants, and the FrostedContainer widget
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/view/home/widgets/components/frosted_container.dart';

class VerticalContainer extends StatelessWidget {
  // Label text displayed at the top
  final String label;

  // Value text displayed below the label
  final String value;

  // Path to the image asset displayed at the top
  final String imagePath;

  // Constructor to initialize label, value, and imagePath
  const VerticalContainer({
    super.key,
    required this.label,
    required this.value,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Use FrostedContainer for a frosted glass effect with rounded corners
    return FrostedContainer(
      height: 100, // Set the container height
      child: Padding(
        padding: const EdgeInsets.all(10), // Add padding for spacing
        child: Column(
          // Arrange child widgets vertically
          children: [
            // Display the image asset at the top
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            // Text widgets stacked vertically to display label and value
            Text(
              label,
              style: lightTitleTextStyle, // Use pre-defined text style
            ),
            Text(
              value,
              style: titleTextStyle, // Use pre-defined text style
            ),
          ],
        ),
      ),
    );
  }
}
