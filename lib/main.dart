import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pather/src/data/repositories/auth_repository.dart';
import 'package:pather/src/home_screen.dart';

import 'firebase_options.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(userRepository: FirebaseUserRepository()),
    );
  }
}