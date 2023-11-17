import 'package:flappy_bird/global/constant.dart';
import 'package:flappy_bird/global/functions.dart';
import 'package:flappy_bird/layouts/pages/game_page.dart';
import 'package:flappy_bird/layouts/pages/settigns_page.dart';
import 'package:flappy_bird/layouts/widgets/widget_bird.dart';
import 'package:flappy_bird/layouts/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final myBox = Hive.box('user');

  @override
  void initState() {
    // Todo : initialize the database  <---
    init();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: background(GameState.background),
        child: Column(
          children: [
            // Flappy bird text
            Container(
              margin: EdgeInsets.only(top: size.height * 0.25),
              child: const Text(
                "FlappyBird",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 70,
                ),
              ),
            ),
            Bird(
              yAxis: GameState.yAxis,
            ),
            const StartScreenButtons(),
            AboutUs(
              size: size,
            )
          ],
        ),
      ),
    );
  }
}

class StartScreenButtons extends StatelessWidget {
  const StartScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GradientButton(
          buttonType: ButtonType.text,
          height: 60,
          width: 278,
          icon: const Icon(
            Icons.play_arrow_rounded,
            size: 60,
            color: Colors.green,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const GamePage(),
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GradientButton(
              buttonType: ButtonType.icon,
              height: 60,
              width: 110,
              icon: Icon(
                Icons.settings,
                size: 40,
                color: Colors.grey.shade900,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SettingsPage(),
                  ),
                );
              },
            ),
            GradientButton(
              buttonType: ButtonType.icon,
              height: 60,
              width: 110,
              icon: const Icon(
                Icons.share_rounded,
                size: 40,
                color: Colors.deepOrange,
              ),
              onTap: () {
                Share.share(
                  "https://github.com/moha-b/Flappy-Bird/releases/download/v.0.4.2/app-release.apk",
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class AboutUs extends StatelessWidget {
  final Size size;

  const AboutUs({required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.2),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return dialog(context);
            },
          );
        },
        child: const Text(
          "About Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
