import 'package:dartz/dartz.dart';
import 'package:product_listing/core/models/api_failure_model.dart';
import 'package:product_listing/core/models/no_param_model.dart';
import 'package:product_listing/feature/home/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<ApiFailureModel, List<ProductEntity>>> getProductList(
      {required NoParamsModel params});
}
