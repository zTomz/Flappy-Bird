import 'package:flappy_bird/Global/constant.dart';
import 'package:flappy_bird/Layouts/Pages/page_game.dart';
import 'package:flappy_bird/Layouts/Pages/page_settings.dart';
import 'package:flutter/material.dart';
import '../Layouts/Pages/page_rate_us.dart';
import '../Layouts/Pages/page_start_screen.dart';

class AppRoute {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Str.home:
        return MaterialPageRoute(builder: (_) => const StartScreen());
      case Str.gamePage:
        return MaterialPageRoute(builder: (_) => GamePage());
      case Str.rateUs:
        return MaterialPageRoute(builder: (_) => const RateUs());
      case Str.settings:
        return MaterialPageRoute(builder: (_) => const Settings());
      default:
        _errorRoute();
    }
    return null;
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Error Page"),
            backgroundColor: Colors.redAccent,
          ),
          body: const Center(
            child: Text("Error"),
          ),
        );
      },
    );
  }
}
