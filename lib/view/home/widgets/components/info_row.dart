// Import library for UI elements and potentially app constants
import 'package:flutter/material.dart';
import 'package:weather_app/utils/constants.dart'; // Assuming lightTitleTextStyle and titleTextStyle are defined here

class InfoRow extends StatelessWidget {
  // Label text displayed on the left side
  final String label;

  // Value text displayed on the right side
  final String value;

  // Constructor to initialize label and value
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    // Column to stack child widgets vertically
    return Column(
      children: [
        // Row to arrange label and value text horizontally with space between
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Display the label text using a pre-defined text style
            Text(
              label,
              style: lightTitleTextStyle,
            ),
            // Display the value text using a pre-defined text style
            Text(
              value,
              style: titleTextStyle,
            ),
          ],
        ),
        // Add a divider line for visual separation
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Divider(
            height:
                1, // Adjust height for desired line thickness (default was 10)
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
