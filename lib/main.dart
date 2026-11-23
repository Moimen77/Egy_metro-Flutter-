import 'package:egypt_metro_navigator/app/initial_binding.dart';
import 'package:egypt_metro_navigator/data/repositories/metro_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    Get.find<MetroRepository>().printTest();
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
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'metro_logic.dart';
import 'stations_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  String? _from;
  String? _to;

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  void _msg(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _calculateRoute() {
    if (_from == _to) {
      _msg('محطة البداية والنهاية نفس المحطة');
      return;
    }
    final r = calculateRoute(_from!, _to!);
    _msg('${r.stationsCount} محطة • ${duration(r.minutes)} • اتجاه ${r.direction}');
  }

  void _showMap(String? station) {
    final point = station == null ? null : stationCoords[station];
    if (point == null) {
      _msg('اختار المحطة الأول');
      return;
    }
    showModalBottomSheet(
      context: context,
      builder: (_) => SizedBox(
        height: 400,
        child: FlutterMap(
          options: MapOptions(initialCenter: point, initialZoom: 15),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.metro_app',
            ),
            MarkerLayer(markers: [
              Marker(
                point: point,
                width: 40,
                height: 40,
                child: const Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, TextEditingController c, String? selected,
      ValueChanged<String?> onPick) {
    return Row(
      children: [
        Expanded(
          child: DropdownMenu<String>(
            controller: c,
            expandedInsets: EdgeInsets.zero,
            enableFilter: true,
            requestFocusOnTap: true,
            label: Text(label),
            menuHeight: 300,
            dropdownMenuEntries: stations
                .map((s) => DropdownMenuEntry(value: s, label: s))
                .toList(),
            onSelected: (v) => setState(() => onPick(v)),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.map),
          onPressed: () => _showMap(selected),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Helwan Metro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _row('من', _fromController, _from, (v) => _from = v),
            const SizedBox(height: 20),
            _row('إلى', _toController, _to, (v) => _to = v),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: (_from != null && _to != null) ? _calculateRoute : null,
                child: const Text('احسب المسار'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}