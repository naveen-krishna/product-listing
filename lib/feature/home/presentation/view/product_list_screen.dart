import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing/feature/home/presentation/bloc/home_bloc.dart';
import 'package:product_listing/feature/home/presentation/view/product_details.dart';
import 'package:product_listing/feature/home/presentation/widget/loading_widget.dart';
import 'package:product_listing/feature/home/presentation/widget/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  HomeBloc get getBloc => context.read<HomeBloc>();

  @override
  void initState() {
    getBloc.add(FetchProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoadingWidget();
          }
          if (state is FetchProductsState) {
            return ListView.builder(
                itemCount: state.products?.length,
                itemBuilder: (context, index) {
                  final product = state.products?[index];

                  return ProductCard(
                    product: product,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen(product: product)),
                      );
                    },
                  );
                });
          }
          return const Placeholder();
        },
      ),
    );
  }
}
