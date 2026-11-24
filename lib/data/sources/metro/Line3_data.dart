import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

final MetroLine line3 = MetroLine(
  id: 3,
  name: 'Line 3',
  directions: ['Adly Mansour', 'Rod El Farag Corridor'],
  stations: List.generate(
    line3Stations.length,
    (index) => Station(
      id: 3000 + index + 1,
      name: line3Stations[index].name,
      lineId: 3,
      latitude: line3Stations[index].lat,
      longitude: line3Stations[index].lng,
    ),
  ),
);

// من عدلي منصور لحد Kit Kat، وبعدها فرع رود الفرج
const List<({String name, double lat, double lng})> line3Stations = [
  (name: 'Adly Mansour', lat: 30.1469, lng: 31.4211),
  (name: 'El-Haykestep', lat: 30.1393, lng: 31.4047),
  (name: 'Omar Ibn El-Khattab', lat: 30.1334, lng: 31.3944),
  (name: 'Qobaa', lat: 30.1273, lng: 31.3847),
  (name: 'Hesham Barakat', lat: 30.1217, lng: 31.3768),
  (name: 'El-Nozha', lat: 30.1152, lng: 31.3683),
  (name: 'Nadi El-Shams', lat: 30.1103, lng: 31.3608),
  (name: 'Alf Maskan', lat: 30.1056, lng: 31.3556),
  (name: 'Heliopolis Square', lat: 30.0903, lng: 31.3375),
  (name: 'Haroun', lat: 30.0847, lng: 31.3294),
  (name: 'Al-Ahram', lat: 30.0795, lng: 31.3258),
  (name: 'Koleyet El-Banat', lat: 30.0728, lng: 31.3294),
  (name: 'Stadium', lat: 30.0731, lng: 31.3114),
  (name: 'Fair Zone', lat: 30.0733, lng: 31.3000),
  (name: 'Abbassia', lat: 30.0711, lng: 31.2833),
  (name: 'Abdou Pasha', lat: 30.0658, lng: 31.2764),
  (name: 'El-Geish', lat: 30.0617, lng: 31.2661),
  (name: 'Bab El-Shaaria', lat: 30.0547, lng: 31.2561),
  (name: 'Attaba', lat: 30.0533, lng: 31.2472),
  (name: 'Nasser', lat: 30.0531, lng: 31.2386),
  (name: 'Maspero', lat: 30.0556, lng: 31.2317),
  (name: 'Safaa Hegazy', lat: 30.0603, lng: 31.2253),
  (name: 'Kit Kat', lat: 30.0664, lng: 31.2156),
  // فرع رود الفرج
  (name: 'Sudan', lat: 30.0714, lng: 31.2103),
  (name: 'Imbaba', lat: 30.0775, lng: 31.2067),
  (name: 'El-Bohy', lat: 30.0825, lng: 31.2056),
  (name: 'El-Qawmia', lat: 30.0903, lng: 31.2042),
  (name: 'Ring Road', lat: 30.0975, lng: 31.2053),
  (name: 'Rod El-Farag Corridor', lat: 30.1058, lng: 31.2008),
];
