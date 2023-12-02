import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_garage/Components/Color.dart';
import 'package:my_garage/Screens/HomeScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primarycolor
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
