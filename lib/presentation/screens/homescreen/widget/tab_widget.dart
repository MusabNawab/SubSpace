import 'package:flutter/material.dart';

class TabWidet extends StatelessWidget {
  const TabWidet({super.key, required this.title, required this.height});

  final String title;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Tab(
        text: title,
      ),
    );
  }
}
