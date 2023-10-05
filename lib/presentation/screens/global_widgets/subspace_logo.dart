import 'package:flutter/material.dart';
import 'package:subspace/presentation/constants/constants.dart';

class SubSpaceLogo extends StatelessWidget {
  const SubSpaceLogo({super.key, required this.width});

  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.subspaceLogo,
      width: width,
    );
  }
}
