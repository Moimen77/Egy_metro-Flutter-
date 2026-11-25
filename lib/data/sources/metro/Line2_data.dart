import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

final MetroLine line2 = MetroLine(
  id: 2,
  name: 'الخط الثاني',
  directions: ['المنيب', 'شبرا الخيمة'],
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
  (name: 'شبرا الخيمة', lat: 30.1219, lng: 31.2447),
  (name: 'كلية الزراعة', lat: 30.1136, lng: 31.2486),
  (name: 'المظلات', lat: 30.1042, lng: 31.2517),
  (name: 'الخلفاوي', lat: 30.0972, lng: 31.2453),
  (name: 'سانت تريزا', lat: 30.0883, lng: 31.2453),
  (name: 'روض الفرج', lat: 30.0803, lng: 31.2453),
  (name: 'مسرة', lat: 30.0706, lng: 31.2447),
  (name: 'الشهداء', lat: 30.0614, lng: 31.2464),
  (name: 'العتبة', lat: 30.0533, lng: 31.2472),
  (name: 'محمد نجيب', lat: 30.0450, lng: 31.2433),
  (name: 'السادات', lat: 30.0444, lng: 31.2344),
  (name: 'الأوبرا', lat: 30.0422, lng: 31.2253),
  (name: 'الدقي', lat: 30.0383, lng: 31.2128),
  (name: 'البحوث', lat: 30.0364, lng: 31.2006),
  (name: 'جامعة القاهرة', lat: 30.0261, lng: 31.2011),
  (name: 'فيصل', lat: 30.0172, lng: 31.2036),
  (name: 'الجيزة', lat: 29.9873, lng: 31.2069),
  (name: 'أم المصريين', lat: 29.9764, lng: 31.2086),
  (name: 'ساقية مكي', lat: 29.9961, lng: 31.2086),
  (name: 'المنيب', lat: 29.9781, lng: 31.2128),
];
