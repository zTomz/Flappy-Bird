import 'package:flappy_bird/Global/constant.dart';
import 'package:flappy_bird/Global/functions.dart';
import 'package:flappy_bird/Layouts/Pages/page_start_screen.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_bird_settings.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_difficulty_settings.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_music_settings.dart';
import 'package:flappy_bird/Layouts/Widgets/widget_themes_settings.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              margin:
                  EdgeInsets.only(top: size.height * 0.08, left: 8, bottom: 10),
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
                  myText("Setting", Colors.pinkAccent, 35),
                  const BirdSettings(),
                  const ThemesSettings(),
                  const MusicSettings(),
                  const DifficultySettings(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan.shade300,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartScreen(),
                        ),
                      );
                    },
                    child: myText("Apply", Colors.white, 35),
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
