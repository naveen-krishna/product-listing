import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing/core/models/api_failure_model.dart';
import 'package:product_listing/core/models/no_param_model.dart';
import 'package:product_listing/feature/home/domain/entities/product_entity.dart';
import 'package:product_listing/feature/home/domain/usecase/get_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProductsDataUsecase getProductsDataUsecase;

  List<ProductEntity>? products;

  TextEditingController searchController = TextEditingController();
  HomeBloc({required this.getProductsDataUsecase}) : super(InitialState()) {
    on<FetchProductsEvent>((event, emitState) async {
      emitState(LoadingState());
      var products = await getProductsDataUsecase(NoParamsModel());
      products.fold((failure) {
        emitState(FetchErrorState(apiFailureModel: failure));
      }, (data) {
        emitState(FetchProductsState(products: data));
      });
    });

    // on<FetchSearchResultsEvent>((event, emitState) async {
    //   isLoading = true;
    //   emitState(LoadingState());
    //   if (event.isNewSearch == true) {
    //     searchDadJokeResultsEntity = null;
    //   }
    //   var searchDadJokeResult =
    //       await getSearchDadJokesUsecase(SearchDadJokeRequestModel(
    //     limit: event.limit,
    //     page: event.page,
    //     term: event.term,
    //   ));

    //   isLoading = false;
    //   SearchDadJokeResultsEntity? searchDadJokeResults;
    //   searchDadJokeResult.fold((failure) {
    //     emitState(FetchErrorState(apiFailureModel: failure));
    //   }, (data) {
    //     searchDadJokeResults = data;
    //     if (searchDadJokeResultsEntity == null) {
    //       searchDadJokeResultsEntity = searchDadJokeResults;
    //       emitState(HideLoadingState());
    //     } else {
    //       searchDadJokeResultsEntity!.results = [
    //         ...searchDadJokeResultsEntity!.results!,
    //         ...searchDadJokeResults!.results!,
    //       ];
    //       searchDadJokeResultsEntity!.currentPage =
    //           searchDadJokeResults!.currentPage;
    //       searchDadJokeResultsEntity!.totalPages =
    //           searchDadJokeResults!.totalPages;
    //       searchDadJokeResultsEntity!.nextPage = searchDadJokeResults!.nextPage;
    //     }
    //     emitState(FetchSearchResultsState());
    //   });
    // });
  }
}
