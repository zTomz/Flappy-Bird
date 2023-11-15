import 'package:flappy_bird/Global/constant.dart';
import 'package:flappy_bird/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'layouts/Pages/page_start_screen.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      home: const StartScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: Str.home,
      onGenerateRoute: AppRoute().generateRoute,
    );
  }
}
