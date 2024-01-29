import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoteDetailView extends GetView {
  const NoteDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$arg'),
        ),
      ),
    );
  }
}
