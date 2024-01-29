import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBoxView extends GetView {
  const LoadingBoxView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: shimmer effect here
    return CircularProgressIndicator();
  }
}
