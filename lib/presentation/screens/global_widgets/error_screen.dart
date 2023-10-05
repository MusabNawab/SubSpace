import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:subspace/logic/providers/blog_list_provider.dart';
import 'package:subspace/presentation/constants/constants.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(
          child: LottieBuilder.asset(
            Constants.error,
            width: 300,
            repeat: false,
          ),
        ),
        const Text(
          "Something went wrong",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton.icon(
          onPressed: () async {
            return await ref.refresh(blogProvider);
          },
          icon: const Icon(Icons.refresh),
          label: const Text(
            "Refresh",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
