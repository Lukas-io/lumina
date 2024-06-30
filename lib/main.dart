import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lumina/config/themes.dart';

import 'features/movies/presentation/pages/home.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  // Set full-screen mode
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor:
        Colors.transparent, // Optional: Set status bar color to transparent
    statusBarIconBrightness:
        Brightness.light, // This sets the icon and text to light (white)
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumina',
      theme: kThemeData,
      home: const Home(),
      // onGenerateRoute: AppRoutes.onGenerateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
