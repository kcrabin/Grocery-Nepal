import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    required this.errorMessage,
    required this.onRetry,
    Key? key,
  }) : super(key: key);

  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Lottie.asset('assets/lottie/error.json'),
        Text(errorMessage),
        ElevatedButton(onPressed: onRetry, child: const Text('Try again'))
      ]),
    );
  }
}
