import 'dart:convert';

import 'package:flutter/material.dart';

class MyMemoryImage extends StatelessWidget {
  const MyMemoryImage(
      {super.key,
      required this.bytes,
      required this.height,
      required this.width});

  final String bytes;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      base64Decode(
        bytes,
      ),
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
