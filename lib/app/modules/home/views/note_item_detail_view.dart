import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmynote/app/modules/home/controllers/home_controller.dart';

class NoteItemDetailView extends GetView {
  const NoteItemDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        id: 'detail',
        init: HomeController(),
        builder: (controller) => (controller.note.value.isNotEmpty)
            ? Text(controller.note.value)
            : const Center(child: Text('Select note to view its contents')),
      ),
    );
  }
}
