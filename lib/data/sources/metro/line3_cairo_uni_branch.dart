// فرع جامعة القاهرة (بيتفرع من Kit Kat)
import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

final MetroLine line3CairoUniBranch = MetroLine(
  id: 4,
  parentLineId: 3,
  name: 'Line 3 - Cairo University Branch',
  directions: ['Kit Kat', 'Cairo University'],
  stations: List.generate(
    line3CairoUniBranchStations.length,
    (index) => Station(
      id: 3100 + index + 1,
      name: line3CairoUniBranchStations[index].name,
      lineId: 4,
      latitude: line3CairoUniBranchStations[index].lat,
      longitude: line3CairoUniBranchStations[index].lng,
    ),
  ),
);

// فرع جامعة القاهرة (بعد Kit Kat)
const List<({String name, double lat, double lng})>
line3CairoUniBranchStations = [
  (name: 'Kit Kat', lat: 30.0664, lng: 31.2156),
  (name: 'Tawfikia', lat: 30.0640, lng: 31.2100),
  (name: 'Wadi El-Nil', lat: 30.0580, lng: 31.2050),
  (name: 'Gamaat El-Dowal', lat: 30.0530, lng: 31.2000),
  (name: 'Boulak El-Dakrour', lat: 30.0360, lng: 31.1930),
  (name: 'Cairo University', lat: 30.0261, lng: 31.2011),
];
