import 'package:egypt_metro_navigator/app/app_routes.dart';
import 'package:egypt_metro_navigator/app/initial_binding.dart';
import 'package:egypt_metro_navigator/core/services/geocoding_service.dart';
import 'package:egypt_metro_navigator/core/theme/AppTheme.dart';
import 'package:egypt_metro_navigator/data/repositories/placeRepo.dart';
import 'package:egypt_metro_navigator/data/sources/metro/metro_data.dart';
import 'package:egypt_metro_navigator/logic/services/nearest_station_service.dart';
import 'package:egypt_metro_navigator/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

void printTest() async {
  try {
    final repository = PlaceRepository(geocodingService: GeocodingService());

    final places = await repository.searchPlaces('Nasr City');

    for (final place in places) {
      print(place.displayAddress);
    }
  } catch (e) {
    print(e);
  }
}

void PrintNearStation() async {
  final placeRepository = PlaceRepository(geocodingService: GeocodingService());

  final places = await placeRepository.searchPlaces('Nasr City');

  final nearestService = NearestStationService();

  if (places.isNotEmpty) {
    final result = nearestService.findNearestStation(
      place: places.first,
      lines: allLines,
    );

    if (result != null) {
      print('Nearest Station: ${result.station.name}');
      print('Line: ${result.station.lineId}');
      print('Distance: ${result.distanceInKm.toStringAsFixed(2)} KM');
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.placeSearch,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    printTest();
    PrintNearStation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
