class PlaceSuggestion {
  final String name;
  final String? city;
  final String? district;
  final String? country;
  final String? type;

  final double latitude;
  final double longitude;

  const PlaceSuggestion({
    required this.name,
    this.city,
    this.district,
    this.country,
    this.type,
    required this.latitude,
    required this.longitude,
  });

  factory PlaceSuggestion.fromJson(Map<String, dynamic> json) {
    final properties = json['properties'] as Map<String, dynamic>;
    final geometry = json['geometry'] as Map<String, dynamic>;

    final coordinates = geometry['coordinates'] as List;

    return PlaceSuggestion(
      name: properties['name'] ?? 'Unknown',
      city: properties['city'],
      district: properties['district'],
      country: properties['country'],
      type: properties['type'],
      longitude: (coordinates[0] as num).toDouble(),
      latitude: (coordinates[1] as num).toDouble(),
    );
  }

  String get displayAddress {
    return [
      district,
      city,
      country,
    ].where((value) => value != null && value.isNotEmpty).join(', ');
  }
}
