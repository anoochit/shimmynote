import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmynote/app/data/services/note.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  AddView({Key? key}) : super(key: key);

  final TextEditingController textContentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                // save note
                _saveNote(content: textContentController.text.trim());
              },
              child: const Text('Save'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: textContentController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type your note here!',
                  ),
                  maxLines: null,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.check_box_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.image_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.smart_toy_outlined),
                  )
                ],
              )
            ],
          ),
        ));
  }

  _saveNote({required String content}) async {
    if (content.isNotEmpty) {
      NoteService().addNote(content: content);
      Get.back();
    } else {
      Get.back();
    }
  }
}
