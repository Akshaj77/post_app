import 'package:dio/dio.dart';
import '../utils/constants.dart';

class ApiService {
  final String baseUrl = kbaseUrl;
  final Dio _dio;

  ApiService() : _dio = Dio(BaseOptions(baseUrl: kbaseUrl));

  Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    try {
      final response = await _dio.post(url, data: body);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to post data');
    }
  }

  Future<Map<String, dynamic>> get(String url, Map<String, dynamic> queryParams) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Failed to get data');
    }
  }
}
