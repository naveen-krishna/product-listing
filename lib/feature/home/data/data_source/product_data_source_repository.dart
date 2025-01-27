import 'package:product_listing/core/models/no_param_model.dart';
import 'package:product_listing/feature/home/data/models/product_model.dart';

abstract class ProductDataSourceRepository {
  Future<List<ProductModel>> getProductList({required NoParamsModel params});
}
