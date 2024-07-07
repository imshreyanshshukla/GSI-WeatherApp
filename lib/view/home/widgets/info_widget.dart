import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/res/images/image_assets.dart';
import 'package:weather_app/view/home/widgets/components/frosted_container.dart';
import 'package:weather_app/view/home/widgets/components/horizontal_container.dart';
import 'package:weather_app/view/home/widgets/components/info_row.dart';
import 'package:weather_app/view/home/widgets/components/vertical_container.dart';
import 'package:weather_app/view_model/controller/global_controller.dart';

class InfoWidget extends StatelessWidget {
  // Constructor for InfoWidget
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the GlobalController using GetX dependency management
    final GlobalController globalController = Get.put(GlobalController());

    // Wrap the content in an Obx widget to rebuild whenever data in GlobalController changes
    return Obx(
      () => Row(
        children: [
          // First expanded section with two VerticalContainer widgets
          Expanded(
            child: Column(
              children: [
                // Row containing sunrise and sunset information
                Row(
                  children: [
                    // Vertical container for sunrise
                    Expanded(
                      child: VerticalContainer(
                        label: 'Sunrise', // Display label "Sunrise"
                        value: globalController
                            .sunriseTime(), // Display sunrise time from GlobalController
                        imagePath:
                            ImageAssets.sunrise, // Use sunrise image asset
                      ),
                    ),
                    // Vertical container for sunset
                    Expanded(
                      child: VerticalContainer(
                        label: 'Sunset', // Display label "Sunset"
                        value: globalController
                            .sunsetTime(), // Display sunset time from GlobalController
                        imagePath: ImageAssets.sunset, // Use sunset image asset
                      ),
                    ),
                  ],
                ),
                // Horizontal container for wind information
                HorizontalContainer(
                  label: globalController
                      .windDirection(), // Display wind direction from GlobalController
                  value: globalController
                      .windSpeed(), // Display wind speed from GlobalController
                  imagePath: ImageAssets.wind, // Use wind image asset
                ),
              ],
            ),
          ),

          // Second expanded section with FrostedContainer containing InfoRow widgets
          Expanded(
            child: FrostedContainer(
              height: 170, // Set container height
              child: Padding(
                padding: const EdgeInsets.all(15), // Add padding
                child: Column(
                  children: [
                    // InfoRow widget for Real Feel
                    InfoRow(
                      label: 'Real Feel',
                      value:
                          '${globalController.feelsLike()} °C', // Display Real Feel with temperature and unit
                    ),
                    // InfoRow widget for Pressure
                    InfoRow(
                      label: 'Pressure',
                      value: globalController
                          .pressure(), // Display pressure from GlobalController
                    ),
                    // InfoRow widget for Humidity
                    InfoRow(
                      label: 'Humidity',
                      value: globalController
                          .humidity(), // Display humidity from GlobalController
                    ),
                    // InfoRow widget for Visibility
                    InfoRow(
                      label: 'Visibility',
                      value: globalController
                          .visibility(), // Display visibility from GlobalController
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
