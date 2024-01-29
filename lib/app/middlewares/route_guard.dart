import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmynote/app/routes/app_pages.dart';
import 'package:shimmynote/const.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (auth.currentUser == null) {
      return const RouteSettings(name: Routes.SIGNIN);
    } else {
      return null;
    }
  }
}
