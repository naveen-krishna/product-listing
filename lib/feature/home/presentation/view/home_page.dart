import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing/core/di/injection_container.dart';
import 'package:product_listing/feature/home/presentation/bloc/home_bloc.dart';
import 'package:product_listing/feature/home/presentation/view/product_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key("HomeScaffoldGestureDetector"),
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: BlocProvider(
            create: (context) => HomeBloc(
              getProductsDataUsecase: sl(),
            ),
            child: const ProductListScreen(),
          ),
        ),
      ),
    );
  }
}
