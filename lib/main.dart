import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

//-----------------------------------------------------
void main() {
  runApp(
    FlutterTaskApp(),
  );
}

//----------------------------
class FlutterTaskApp extends StatefulWidget {
  const FlutterTaskApp({super.key});

  @override
  State<FlutterTaskApp> createState() => _FlutterTaskAppState();
}

class _FlutterTaskAppState extends State<FlutterTaskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.promptTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}

