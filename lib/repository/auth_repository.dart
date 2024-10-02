import '../service/api_service.dart';
import '../utils/constants.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await apiService.post(
      ksignupUrl,
      {
        'email': email,
        'password': password,
      },
    );
  }
}
