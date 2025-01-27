import 'package:http/http.dart';
import 'package:product_listing/core/constants/api_constants.dart';
import 'package:product_listing/core/network_repository/network_repository.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  @override
  Future<Response> getRequest(
      {required String urlSuffix,
      Map<String, String>? headers,
      Map<String, String>? queries}) async {
    String apiEndpoint = baseUrl + urlSuffix;
    if (queries != null) {
      apiEndpoint += "?";
      queries.forEach((key, value) {
        apiEndpoint += "$key=$value&";
      });
    }

    final response = await get(
      Uri.parse(apiEndpoint),
      headers: headers ?? {"Accept": "application/json"},
    );
    return response;
  }
}
