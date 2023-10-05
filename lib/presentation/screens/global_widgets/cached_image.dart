import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImg extends StatelessWidget {
  const CachedImg({super.key, required this.networkImg, required this.placeholder1, required this.placeholder2, required this.height, required this.width});

  final String networkImg;
  final String placeholder1;
  final String placeholder2;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageUrl: networkImg,
      placeholder: (context, url) => Image.asset(
        placeholder1,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
      errorWidget: (context, url, error) => Image.asset(
        placeholder2,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
