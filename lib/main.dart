import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie/app/movie_app.dart';
import 'package:movie/core/Di/services/get_it_locator.dart';
import 'package:movie/firebase_options.dart';

import 'core/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServicesLocator();
  runApp(
    MovieApp(
      routing: Routing(),
    ),
  );
}
