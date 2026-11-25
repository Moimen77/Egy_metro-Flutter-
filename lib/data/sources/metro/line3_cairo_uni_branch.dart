// فرع جامعة القاهرة (بيتفرع من الكيت كات)
import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

final MetroLine line3CairoUniBranch = MetroLine(
  id: 4,
  parentLineId: 3,
  name: 'الخط الثالث - فرع جامعة القاهرة',
  directions: ['الكيت كات', 'جامعة القاهرة'],
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

// فرع جامعة القاهرة (بعد الكيت كات)
const List<({String name, double lat, double lng})>
line3CairoUniBranchStations = [
  (name: 'الكيت كات', lat: 30.0664, lng: 31.2156),
  (name: 'التوفيقية', lat: 30.0640, lng: 31.2100),
  (name: 'وادي النيل', lat: 30.0580, lng: 31.2050),
  (name: 'جامعة الدول العربية', lat: 30.0530, lng: 31.2000),
  (name: 'بولاق الدكرور', lat: 30.0360, lng: 31.1930),
  (name: 'جامعة القاهرة', lat: 30.0261, lng: 31.2011),
];
