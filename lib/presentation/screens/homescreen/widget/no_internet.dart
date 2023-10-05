import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:subspace/presentation/constants/constants.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            Constants.noInternet,
            repeat: false,
          ),
          const Text(
            "No internet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Please connect to internet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
