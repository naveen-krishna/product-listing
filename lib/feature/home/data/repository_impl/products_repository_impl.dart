import 'package:dartz/dartz.dart';
import 'package:product_listing/core/base/base_exception_model.dart';
import 'package:product_listing/core/models/api_failure_model.dart';
import 'package:product_listing/core/models/no_param_model.dart';
import 'package:product_listing/feature/home/data/data_source/product_data_source_repository.dart';
import 'package:product_listing/feature/home/data/models/product_model.dart';
import 'package:product_listing/feature/home/domain/entities/product_entity.dart';
import 'package:product_listing/feature/home/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSourceRepository productDataSourceRepository;

  ProductRepositoryImpl({required this.productDataSourceRepository});

  @override
  Future<Either<ApiFailureModel, List<ProductEntity>>> getProductList(
          {required NoParamsModel params}) =>
      baseMethodExceptions(() => getProductListApi(params: params));

  Future<Either<ApiFailureModel, List<ProductEntity>>> getProductListApi(
      {required NoParamsModel params}) async {
    List<ProductEntity> productListEntity;

    List<ProductModel> productListModel =
        await productDataSourceRepository.getProductList(params: params);

    productListEntity = productListModel.map((model) {
      ProductEntity entity = ProductEntity();
      return entity(model);
    }).toList();

    return Right(productListEntity);
  }
}
