import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NoteItemView extends GetView {
  const NoteItemView({Key? key, required this.content, required this.onTap})
      : super(key: key);

  final VoidCallback onTap;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Theme.of(context).colorScheme.onInverseSurface,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => onTap(),
          child: Text(
            content,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
