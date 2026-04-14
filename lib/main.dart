import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//-----------------------------------------------------
void main() async { //การรอ
  //---------กำหนดค่าการติดต่อกับ project บน supabase ที่จะทำงานด้วย-------------------
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ifdtuxlcnjybkusjrltm.supabase.co',
    // Project คีย์สำหรับการเข้าถึง project บน supabase อยู่ที่ project setting > API > Project API keys > anon public
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmZHR1eGxjbmp5Ymt1c2pybHRtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM5OTYyNDUsImV4cCI6MjA4OTU3MjI0NX0.jupeJwOheiFJyzVHJiOxb-gjkfXligRbZaWCW36EQU4',
        // กุญแจ คีย์สำหรับการเข้าถึง project บน supabase
  );
  //----------------------------
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

