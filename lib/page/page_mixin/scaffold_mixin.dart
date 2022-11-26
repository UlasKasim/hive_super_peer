import 'package:flutter/material.dart';

mixin ScaffoldMixin<T extends StatefulWidget> on State<T> {
  String appBarTitle = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: body(),
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget body();
  Widget? floatingActionButton();
}
