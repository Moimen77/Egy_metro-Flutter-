import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

final MetroLine line3 = MetroLine(
  id: 3,
  name: 'Line 3',
  directions: ['Adly Mansour', 'Rod El Farag Corridor'],
  stations: List.generate(
    line3Stations.length,
    (index) =>
        Station(id: 3000 + index + 1, name: line3Stations[index], lineId: 3),
  ),
);

// من عدلي منصور لحد Kit Kat، وبعدها فرع رود الفرج
const List<String> line3Stations = [
  'Adly Mansour',
  'El-Haykestep',
  'Omar Ibn El-Khattab',
  'Qobaa',
  'Hesham Barakat',
  'El-Nozha',
  'Nadi El-Shams',
  'Alf Maskan',
  'Heliopolis Square',
  'Haroun',
  'Al-Ahram',
  'Koleyet El-Banat',
  'Stadium',
  'Fair Zone',
  'Abbassia',
  'Abdou Pasha',
  'El-Geish',
  'Bab El-Shaaria',
  'Attaba',
  'Nasser',
  'Maspero',
  'Safaa Hegazy',
  'Kit Kat',
  // فرع رود الفرج
  'Sudan',
  'Imbaba',
  'El-Bohy',
  'El-Qawmia',
  'Ring Road',
  'Rod El-Farag Corridor',
];
