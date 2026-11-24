// views/place_search_view.dart
import 'package:egypt_metro_navigator/Widgets/SearchField.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/FlagStrip.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/PlaceSearchContent.dart';
import 'package:egypt_metro_navigator/features/place_search/view/widgets/PlaceSearchHeader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/place_search_controller.dart';

class PlaceSearchView extends GetView<PlaceSearchController> {
  const PlaceSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أقرب محطة مترو'),
        bottom: const FlagStrip(),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PlaceSearchHeader(),
                const SizedBox(height: 20),
                Obx(
                  () => SearchField(
                    controller: controller.searchController,
                    onChanged: controller.onSearchChanged,
                    onClear: controller.clearSearch,
                    showClear: controller.searchQuery.value.isNotEmpty,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Obx(
                    () => PlaceSearchContent(
                      isLoading: controller.isLoading.value,
                      errorMessage: controller.errorMessage.value,
                      suggestions: controller.suggestions.toList(),
                      selectedPlace: controller.selectedPlace.value,
                      nearestStation: controller.nearestStation.value,
                      onSelectPlace: controller.selectPlace,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
