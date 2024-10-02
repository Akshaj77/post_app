import '../service/api_service.dart';
import '../utils/constants.dart';

class EventRepository {
  final ApiService apiService;

  EventRepository(this.apiService);

  Future<Map<String, dynamic>> fetchEvents(int page, int limit) async {
    return await apiService.get(keventFetchUrl, {
      'page': page.toString(),
      'limit': limit.toString(),
    });
  }

  Future<Map<String, dynamic>> searchEvents(String query, int page, int limit) async {
    return await apiService.get('/search', {
      'q': query,
      'page': page.toString(),
      'limit': limit.toString(),
    });
  }
}
