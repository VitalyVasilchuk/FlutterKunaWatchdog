import 'package:flutter/material.dart';

class ErrorBoxWidget extends StatelessWidget {
  final String message;

  const ErrorBoxWidget(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 24,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(message)
            ],
          ),
        ),
      );
}
