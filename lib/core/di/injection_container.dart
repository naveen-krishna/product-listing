import 'package:get_it/get_it.dart';
import 'package:product_listing/core/network_repository/network_repository.dart';
import 'package:product_listing/core/network_repository/network_repository_impl.dart';
import 'package:product_listing/feature/home/data/data_source/product_data_source_repository.dart';
import 'package:product_listing/feature/home/data/data_source/product_data_source_repository_impl.dart';
import 'package:product_listing/feature/home/data/repository_impl/products_repository_impl.dart';
import 'package:product_listing/feature/home/domain/repository/product_repository.dart';
import 'package:product_listing/feature/home/domain/usecase/get_products_usecase.dart';

final sl = GetIt.instance;

injectionContainer() {
  sl.registerLazySingleton<NetworkRepository>(() => NetworkRepositoryImpl());

  sl.registerLazySingleton<ProductDataSourceRepository>(
      () => ProductDataSourceRepositoryImpl(networkRepository: sl()));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(productDataSourceRepository: sl()));
  sl.registerLazySingleton(() => GetProductsDataUsecase(sl()));
}
