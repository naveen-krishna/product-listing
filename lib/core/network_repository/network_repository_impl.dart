import 'package:http/http.dart';
import 'package:product_listing/core/constants/api_constants.dart';
import 'package:product_listing/core/network_repository/network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  @override
  Future<Response> getRequest({
    required String urlSuffix,
    Map<String, String>? headers,
  }) async {
    String apiEndpoint = baseUrl + urlSuffix;

    final response = await get(
      Uri.parse(apiEndpoint),
      headers: headers ?? {"Accept": "application/json"},
    );
    return response;
  }
}
