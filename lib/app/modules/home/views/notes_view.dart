import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/services/note.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/views/error_box_view.dart';
import '../../../widgets/views/loading_box_view.dart';
import '../controllers/home_controller.dart';
import 'add_button_view.dart';
import 'note_item_view.dart';

class NotesView extends GetView<HomeController> {
  const NotesView({Key? key, required this.isLandscape}) : super(key: key);

  final bool isLandscape;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShimmyNote'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: NoteService().getNotesStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return ErrorBoxView(
              message: '${snapshot.error}',
            );
          }

          if (snapshot.hasData) {
            final notes = snapshot.data!.docs;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return NoteItemView(
                  content: notes[index]['content'],
                  onTap: () {
                    if (isLandscape) {
                      controller.note.value = notes[index]['content'];
                      controller.update(['detail']);
                    } else {
                      Get.toNamed(
                        Routes.NOTE_DETAIL,
                        arguments: notes[index]['content'],
                      );
                    }
                  },
                );
              },
            );
          }

          return const LoadingBoxView();
        },
      ),
      floatingActionButton: AddButtonView(onTap: () {
        // add note
        Get.toNamed(Routes.ADD);
      }),
    );
  }
}
