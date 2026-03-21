import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/show_all_task_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // code relay
    Future.delayed(
      Duration(seconds: 3),
    // start up
    (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ShowAllTaskUi(),
        ),
      );
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 29, 58),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 25),
                Text(
                  ' ☻ TASK ME ☻',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(height: 25),
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Created by Turnray SAU',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  'Southeast Asia Uinversity',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
