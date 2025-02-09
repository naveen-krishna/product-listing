import 'package:flutter/material.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: body(context),
    );
  }

  Widget body(context);

  toast(String message) {
    final snackBar = SnackBar(
      content: Text(message ?? 'Yay! A SnackBar!'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
