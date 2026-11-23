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
      name: line3CairoUniBranchStations[index],
      lineId: 4,
    ),
  ),
);

// فرع جامعة القاهرة (بعد Kit Kat)
const List<String> line3CairoUniBranchStations = [
  'Kit Kat',
  'Tawfikia',
  'Wadi El-Nil',
  'Gamaat El-Dowal',
  'Boulak El-Dakrour',
  'Cairo University',
];
