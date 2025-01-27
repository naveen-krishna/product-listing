import 'package:dartz/dartz.dart';
import 'package:product_listing/core/models/api_failure_model.dart';
import 'package:product_listing/core/models/no_param_model.dart';
import 'package:product_listing/core/usecase/usecase.dart';
import 'package:product_listing/feature/home/domain/entities/product_entity.dart';
import 'package:product_listing/feature/home/domain/repository/product_repository.dart';

class GetProductsDataUsecase extends Usecase<
    Either<ApiFailureModel, List<ProductEntity>>, NoParamsModel> {
  final ProductRepository productRepository;

  GetProductsDataUsecase(this.productRepository);
  @override
  Future<Either<ApiFailureModel, List<ProductEntity>>> call(
          NoParamsModel params) async =>
      productRepository.getProductList(params: params);
}
