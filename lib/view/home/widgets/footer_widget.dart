import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/view_model/controller/global_controller.dart';

class FooterWidget extends StatelessWidget {
  // Constructor for FooterWidget
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the GlobalController using GetX dependency management
    final GlobalController globalController = Get.put(GlobalController());

    // Footer with padding on the left and right sides
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        // Arrange child widgets horizontally with space between
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Display the text "OpenWeather" using a pre-defined text style
          const Text(
            'OpenWeather',
            style: lightBodyTextStyle,
          ),
          // Display the text "Last updated" followed by the formatted last update time
          // retrieved from the GlobalController using dtValue() method
          Text(
            'Last updated ${globalController.dtValue()}',
            style: lightBodyTextStyle,
          ),
        ],
      ),
    );
  }
}
