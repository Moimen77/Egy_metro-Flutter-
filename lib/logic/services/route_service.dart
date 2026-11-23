import '../../data/models/station.dart';
import '../../data/repositories/metro_repository.dart';
import '../algorithms/bfs.dart';

class RouteService {
  // بيرجع المسار المحطات ال بين محطتين
  final MetroRepository repository;

  RouteService({required this.repository});

  List<Station>? findRoute({
    required int startStationId,
    required int destinationStationId,
  }) {
    return bfs(repository.graph, startStationId, destinationStationId);
  }
}
