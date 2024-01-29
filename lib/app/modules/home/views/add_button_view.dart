import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddButtonView extends GetView {
  const AddButtonView({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onTap(),
      child: const Icon(Icons.add),
    );
  }
}
