import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

final MetroLine line2 = MetroLine(
  id: 2,
  name: 'Line 2',
  directions: ['El Moneeb', 'Shubra El Kheima'],
  stations: List.generate(
    line2Stations.length,
    (index) => Station(
      id: 2000 + index + 1,
      name: line2Stations[index].name,
      lineId: 2,
      latitude: line2Stations[index].lat,
      longitude: line2Stations[index].lng,
    ),
  ),
);

const List<({String name, double lat, double lng})> line2Stations = [
  (name: 'Shubra El-Kheima', lat: 30.1219, lng: 31.2447),
  (name: 'Kolleyet El-Zeraa', lat: 30.1136, lng: 31.2486),
  (name: 'El-Mazallat', lat: 30.1042, lng: 31.2517),
  (name: 'El-Khalafawi', lat: 30.0972, lng: 31.2453),
  (name: 'St. Teresa', lat: 30.0883, lng: 31.2453),
  (name: 'Rod El-Farag', lat: 30.0803, lng: 31.2453),
  (name: 'Masarra', lat: 30.0706, lng: 31.2447),
  (name: 'Al-Shohadaa', lat: 30.0614, lng: 31.2464),
  (name: 'Attaba', lat: 30.0533, lng: 31.2472),
  (name: 'Mohamed Naguib', lat: 30.0450, lng: 31.2433),
  (name: 'Sadat', lat: 30.0444, lng: 31.2344),
  (name: 'Opera', lat: 30.0422, lng: 31.2253),
  (name: 'Dokki', lat: 30.0383, lng: 31.2128),
  (name: 'El-Bohoth', lat: 30.0364, lng: 31.2006),
  (name: 'Cairo University', lat: 30.0261, lng: 31.2011),
  (name: 'Faisal', lat: 30.0172, lng: 31.2036),
  (name: 'Giza', lat: 29.9873, lng: 31.2069),
  (name: 'Omm El-Misryeen', lat: 29.9764, lng: 31.2086),
  (name: 'Sakiat Mekki', lat: 29.9961, lng: 31.2086),
  (name: 'El-Mounib', lat: 29.9781, lng: 31.2128),
];
