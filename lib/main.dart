import 'package:flappy_bird/database/database.dart';
import 'package:flappy_bird/layouts/pages/start_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await Database.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Magic4",
      ),
      debugShowCheckedModeBanner: false,
      home: const StartScreen(),
    );
  }
}
