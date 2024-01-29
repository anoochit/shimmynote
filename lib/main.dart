import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmynote/app/modules/home/views/home_view.dart';
import 'package:shimmynote/app/modules/signin/views/signin_view.dart';
import 'package:shimmynote/const.dart';
import 'package:shimmynote/firebase_options.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(DynamicColorBuilder(
    builder: (lightDynamic, darkDynamic) {
      return GetMaterialApp(
        title: "Application",
        theme: ThemeData(
          colorScheme: lightDynamic,
        ),
        darkTheme: ThemeData(
          colorScheme: darkDynamic,
        ),
        getPages: AppPages.routes,
        home: StreamBuilder(
          stream: auth.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.data != null) {
              return const HomeView();
            }

            return const SigninView();
          },
        ),
      );
    },
  ));
}
