import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'note_item_detail_view.dart';
import 'notes_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              // show two pane
              return const Flex(
                direction: Axis.horizontal,
                children: [
                  // show note
                  Flexible(
                    flex: 1,
                    child: NotesView(isLandscape: true),
                  ),

                  // show note detail
                  Flexible(
                    flex: 1,
                    child: NoteItemDetailView(),
                  ),
                ],
              );
            } else {
              // show one pane
              return const NotesView(isLandscape: false);
            }
          },
        ),
      ),
    );
  }
}
