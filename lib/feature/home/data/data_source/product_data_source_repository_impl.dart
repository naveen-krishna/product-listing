import 'package:product_listing/core/constants/api_constants.dart';
import 'package:product_listing/core/models/no_param_model.dart';
import 'package:product_listing/core/network_repository/network_repository.dart';
import 'package:product_listing/feature/home/data/data_source/product_data_source_repository.dart';
import 'package:product_listing/feature/home/data/models/product_model.dart';

class ProductDataSourceRepositoryImpl extends ProductDataSourceRepository {
  final NetworkRepository networkRepository;

  ProductDataSourceRepositoryImpl({required this.networkRepository});

  @override
  Future<List<ProductModel>> getProductList(
      {required NoParamsModel params}) async {
    final response = await networkRepository.getRequest(urlSuffix: productList);

    return productModelFromJson(response.body);
  }
}
