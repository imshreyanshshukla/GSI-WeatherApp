// Import libraries for UI elements, app constants, and the FrostedContainer widget
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/view/home/widgets/components/frosted_container.dart';

class HorizontalContainer extends StatelessWidget {
  // Label text displayed on the left side
  final String label;

  // Value text displayed on the right side
  final String value;

  // Path to the image asset displayed on the left side
  final String imagePath;

  // Constructor to initialize label, value, and imagePath
  const HorizontalContainer({
    super.key,
    required this.label,
    required this.value,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Use FrostedContainer for a frosted glass effect with rounded corners
    return FrostedContainer(
      height: 65, // Set the container height
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          // Arrange child widgets horizontally with space between
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display the image asset on the left
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            // Column to stack label and value text vertically
            Column(
              children: [
                // Display the label text using a pre-defined text style (lightTitleTextStyle likely defined in constants.dart)
                Text(
                  label,
                  style: lightTitleTextStyle,
                ),
                // Display the value text using a pre-defined text style (titleTextStyle likely defined in constants.dart)
                Text(
                  value,
                  style: titleTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
