import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchNoteView extends GetView {
  const SearchNoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchNoteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchNoteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
