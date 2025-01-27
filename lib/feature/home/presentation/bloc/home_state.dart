part of 'home_bloc.dart';

sealed class HomeState {}

class InitialState extends HomeState {}

class FetchProductsState extends HomeState {
  List<ProductEntity>? products;
  FetchProductsState({required this.products});
}

class LoadingState extends HomeState {}

class FetchErrorState extends HomeState {
  final ApiFailureModel apiFailureModel;

  FetchErrorState({required this.apiFailureModel});
}
