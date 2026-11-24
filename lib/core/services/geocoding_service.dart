import 'package:dio/dio.dart';
import 'package:egypt_metro_navigator/data/models/placeSugestion.dart';

class GeocodingService {
  final Dio _dio;

  GeocodingService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: 'https://photon.komoot.io',
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              headers: {
                'User-Agent':
                    'MetroEgyptApp/1.0 (contact: moimenadel156@gmail.com)',
                'Accept': 'application/json',
              },
            ),
          );

  Future<List<PlaceSuggestion>> searchPlaces(String query) async {
    if (query.trim().isEmpty) return [];

    try {
      final response = await _dio.get(
        '/api/',
        queryParameters: {'q': query.trim(), 'limit': 5, 'lang': 'en'},
      );

      final features = response.data['features'] as List;

      return features
          .map(
            (feature) =>
                PlaceSuggestion.fromJson(feature as Map<String, dynamic>),
          )
          .toList();
    } on DioException catch (e) {
      throw Exception('Geocoding API Error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to parse places: $e');
    }
  }
}
