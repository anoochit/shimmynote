import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ErrorBoxView extends GetView {
  const ErrorBoxView({Key? key, required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning),
          Text(
            message,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
