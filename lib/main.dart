import 'dart:async';

import 'package:appi/Instruction.dart';
import 'package:appi/Login.dart';
import 'package:appi/Registration.dart';
import 'package:appi/Trigger.dart';
import 'package:appi/options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  // }

  runApp(
    MaterialApp(
      home: const Options(), //Google(lat: 22.622508, lon: 88.443714),
      debugShowCheckedModeBanner: false,
      routes: {
        'Registration': (context) => const MyRegistration(),
        'Trigger': (context) => const MyTrigger(),
        'Instruction': (context) => const Instruction(),
        'login': (context) => const MyLogin(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
Future<FirebaseRemoteConfig> activateRemoteConfig() async {
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ),
  );
  await remoteConfig.fetchAndActivate();
  return remoteConfig;
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/img2.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'WELCOME TO APPI',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 10),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyLogin(),
        ),
      ),
    );
  }
}
