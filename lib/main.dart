import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happyheart/screens/splashscreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
// Firebase configuration file lib\firebase_options.dart generated successfully with the following Firebase apps:
//
// Platform  Firebase App Id
// android   1:991332688559:android:35362475b17e4503c9ea5a
// ios       1:991332688559:ios:46d72e25fc8330bdc9ea5a

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy hearts',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),

      // const SplashScreen(),
      builder: (context, child) {
        var mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 0.75,
            boldText: false,
            devicePixelRatio:
                mediaQuery.devicePixelRatio * mediaQuery.textScaleFactor,
          ),
          child: child!,
        );
      },
    );
  }
}
