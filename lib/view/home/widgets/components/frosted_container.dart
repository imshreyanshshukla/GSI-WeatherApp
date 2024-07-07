// Import libraries for UI elements and background blur effects
import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedContainer extends StatelessWidget {
  // The child widget to be displayed within the frosted container
  final Widget child;

  // The desired height of the frosted container
  final double height;

  // Constructor to initialize child and height
  const FrostedContainer(
      {super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    // Add a small padding around the container
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ClipRRect(
        // Apply rounded corners to the container
        borderRadius: BorderRadius.circular(15),
        child: Container(
          // Set the container height based on the provided value
          height: height,
          // Set the container color to transparent to allow background visibility
          color: Colors.transparent,
          child: Stack(
            // Stack multiple widgets to achieve the frosted effect with border and gradient
            children: [
              // Apply a blur filter to create the frosted glass effect
              BackdropFilter(
                filter: ImageFilter.blur(
                  // Adjust sigma values to control the blur intensity (higher = more blur)
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                    // This empty container serves as a placeholder for the filter
                    ),
              ),
              // Container with rounded corners and a subtle white border
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.07),
                  ),
                  gradient: LinearGradient(
                    // Define the gradient direction and colors for a frosted look
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.15),
                      Colors.white.withOpacity(0.05),
                    ],
                  ),
                ),
              ),
              // Center the child widget within the frosted container
              Center(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
