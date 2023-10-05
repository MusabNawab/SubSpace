import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {super.key,
      required this.title,
      required this.bottom,
      required this.body,
      required this.drawer,
      required this.floatingActionButton});

  final Widget? title;
  final PreferredSize? bottom;
  final Widget? body;
  final Widget? drawer;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        bottom: bottom,
      ),
      body: body,
      endDrawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}
