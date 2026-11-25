import 'package:egypt_metro_navigator/data/models/MetroLine.dart';
import 'package:egypt_metro_navigator/data/models/station.dart';

final MetroLine line3 = MetroLine(
  id: 3,
  name: 'الخط الثالث',
  directions: ['عدلي منصور', 'محور روض الفرج'],
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

// من عدلي منصور لحد الكيت كات، وبعدها فرع روض الفرج
const List<({String name, double lat, double lng})> line3Stations = [
  (name: 'عدلي منصور', lat: 30.1469, lng: 31.4211),
  (name: 'الهايكستب', lat: 30.1393, lng: 31.4047),
  (name: 'عمر بن الخطاب', lat: 30.1334, lng: 31.3944),
  (name: 'قباء', lat: 30.1273, lng: 31.3847),
  (name: 'هشام بركات', lat: 30.1217, lng: 31.3768),
  (name: 'النزهة', lat: 30.1152, lng: 31.3683),
  (name: 'نادي الشمس', lat: 30.1103, lng: 31.3608),
  (name: 'ألف مسكن', lat: 30.1056, lng: 31.3556),
  (name: 'ميدان هليوبوليس', lat: 30.0903, lng: 31.3375),
  (name: 'هارون', lat: 30.0847, lng: 31.3294),
  (name: 'الأهرام', lat: 30.0795, lng: 31.3258),
  (name: 'كلية البنات', lat: 30.0728, lng: 31.3294),
  (name: 'الاستاد', lat: 30.0731, lng: 31.3114),
  (name: 'أرض المعارض', lat: 30.0733, lng: 31.3000),
  (name: 'العباسية', lat: 30.0711, lng: 31.2833),
  (name: 'عبده باشا', lat: 30.0658, lng: 31.2764),
  (name: 'الجيش', lat: 30.0617, lng: 31.2661),
  (name: 'باب الشعرية', lat: 30.0547, lng: 31.2561),
  (name: 'العتبة', lat: 30.0533, lng: 31.2472),
  (name: 'ناصر', lat: 30.0531, lng: 31.2386),
  (name: 'ماسبيرو', lat: 30.0556, lng: 31.2317),
  (name: 'صفاء حجازي', lat: 30.0603, lng: 31.2253),
  (name: 'الكيت كات', lat: 30.0664, lng: 31.2156),
  // فرع روض الفرج
  (name: 'السودان', lat: 30.0714, lng: 31.2103),
  (name: 'إمبابة', lat: 30.0775, lng: 31.2067),
  (name: 'البوهي', lat: 30.0825, lng: 31.2056),
  (name: 'القومية العربية', lat: 30.0903, lng: 31.2042),
  (name: 'الطريق الدائري', lat: 30.0975, lng: 31.2053),
  (name: 'محور روض الفرج', lat: 30.1058, lng: 31.2008),
];
