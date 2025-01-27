import 'package:flutter/material.dart';
import 'package:product_listing/core/di/injection_container.dart';
import 'package:product_listing/feature/home/presentation/view/home_page.dart';

void main() {
  injectionContainer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
