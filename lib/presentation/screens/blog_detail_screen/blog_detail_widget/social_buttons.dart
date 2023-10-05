import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(onTap: () {}, child: Image.asset("assets/images/facebook.png")),
        InkWell(onTap: () {}, child: Image.asset("assets/images/twitter.png")),
        InkWell(onTap: () {}, child: Image.asset("assets/images/linkedin.png")),
      ],
    );
  }
}
