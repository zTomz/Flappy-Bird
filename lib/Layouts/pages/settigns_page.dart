import 'package:flappy_bird/global/constant.dart';
import 'package:flappy_bird/global/functions.dart';
import 'package:flappy_bird/layouts/pages/start_screen_page.dart';
import 'package:flappy_bird/layouts/widgets/widget_bird_settings.dart';
import 'package:flappy_bird/layouts/widgets/widget_difficulty_settings.dart';
import 'package:flappy_bird/layouts/widgets/widget_music_settings.dart';
import 'package:flappy_bird/layouts/widgets/widget_themes_settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: background(Str.image),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.08,
                left: 8,
                bottom: 10,
              ),
              alignment: const Alignment(-1, 0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: size.width * 0.78,
              height: size.height * 0.75,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(10),
              decoration: frame(),
              child: Column(
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 35,
                    ),
                  ),
                  const BirdSettings(),
                  const ThemesSettings(),
                  const MusicSettings(),
                  const DifficultySettings(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan.shade300,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
