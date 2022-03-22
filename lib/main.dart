import 'dart:async';

import 'package:flutter/material.dart';
import 'package:appi/Login.dart';
import 'package:appi/Registration.dart';
import 'package:appi/Trigger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: const MyLogin(),
      debugShowCheckedModeBanner: false,
      routes: {
        'Registration': (context) => const MyRegistration(),
        'Trigger': (context) => const MyTrigger(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
