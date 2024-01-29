import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shimmynote/const.dart';

class NoteService {
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotesStream() {
    return firestore
        .collection('notes')
        .doc(auth.currentUser!.uid)
        .collection('items')
        .snapshots();
  }

  Future<void> addNote({required String content}) async {
    await firestore
        .collection('notes')
        .doc(auth.currentUser!.uid)
        .collection('items')
        .doc('${DateTime.now().microsecondsSinceEpoch}')
        .set({"content": content}).catchError((error) {
      Get.snackbar('Error', '$error');
    });
  }
}
