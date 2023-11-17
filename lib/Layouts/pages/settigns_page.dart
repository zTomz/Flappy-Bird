import 'package:flappy_bird/layouts/widgets/game_button.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird/database/database.dart';
import 'package:flappy_bird/global/constant.dart';
import 'package:flappy_bird/global/functions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late PageController playerSelectorController;
  late PageController backgroundSelectorController;
  late PageController difficultySelectorController;

  @override
  void initState() {
    super.initState();

    int initialPage = 0;

    switch (GameState.bird) {
      case "assets/images/bird.png":
        initialPage = 0;
        break;
      case "assets/images/blue.png":
        initialPage = 1;
        break;
      case "assets/images/green.png":
        initialPage = 2;
        break;
    }

    playerSelectorController = PageController(
      viewportFraction: 0.45,
      initialPage: initialPage,
    );

    switch (GameState.background) {
      case "assets/images/background-0.png":
        initialPage = 0;
        break;
      case "assets/images/background-1.png":
        initialPage = 1;
        break;
      case "assets/images/background-2.png":
        initialPage = 2;
        break;
    }

    backgroundSelectorController = PageController(
      viewportFraction: 0.45,
      initialPage: initialPage,
    );

    difficultySelectorController = PageController();
  }

  @override
  void dispose() {
    playerSelectorController.dispose();
    backgroundSelectorController.dispose();
    difficultySelectorController.dispose();

    super.dispose();
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
            const SizedBox(height: 50),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Player",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 120,
              child: PageView.builder(
                itemCount: 3,
                controller: playerSelectorController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int index) {
                  GameState.bird =
                      "assets/images/${["bird", "blue", "green"][index]}.png";
                  Database.write(BoxId.bird, GameState.bird);
                },
                itemBuilder: (context, index) => Image.asset(
                  "assets/images/${["bird", "blue", "green"][index]}.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Theme",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: backgroundSelectorController,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int index) {
                  GameState.background = "assets/images/${[
                    "background-0",
                    "background-1",
                    "background-2",
                  ][index]}.png";

                  Database.write(
                    BoxId.background,
                    GameState.background,
                  );

                  setState(() {});
                  debugPrint("Changed background to ${GameState.background}");
                },
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 125,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.6),
                            blurRadius: 10.0,
                            spreadRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/${[
                          "background-0",
                          "background-1",
                          "background-2",
                        ][index]}.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Music",
                style: TextStyle(
                  color:
                      GameState.background == "assets/images/background-0.png"
                          ? Colors.black
                          : Colors.white,
                  fontSize: 25,
                ),
              ),
              trailing: Switch(
                value: GameState.playMusic,
                onChanged: (value) async {
                  GameState.playMusic = value;

                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Difficulty",
                    style: TextStyle(
                      color: GameState.background ==
                              "assets/images/background-0.png"
                          ? Colors.black
                          : Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  IconButtonTheme(
                    data: IconButtonThemeData(
                      style: ButtonStyle(
                        iconColor: MaterialStateProperty.all(
                          GameState.background ==
                                  "assets/images/background-0.png"
                              ? Colors.black
                              : Colors.white,
                        ),
                        padding: MaterialStateProperty.resolveWith<
                            EdgeInsetsGeometry?>(
                          (states) {
                            return EdgeInsets.zero;
                          },
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            difficultySelectorController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: const Icon(Icons.arrow_drop_up_rounded),
                          iconSize: 50,
                        ),
                        SizedBox(
                          height: 40,
                          width: 125,
                          child: PageView.builder(
                            controller: difficultySelectorController,
                            itemCount: 3,
                            scrollDirection: Axis.vertical,
                            onPageChanged: (int index) {
                              if (index == 0) {
                                GameState.barrierMovement = 0.05;
                                Database.write(
                                  BoxId.level,
                                  GameState.barrierMovement,
                                );
                              }

                              if (index == 1) {
                                GameState.barrierMovement = 0.08;
                                Database.write(
                                  BoxId.level,
                                  GameState.barrierMovement,
                                );
                              }

                              if (index == 2) {
                                GameState.barrierMovement = 0.1;
                                Database.write(
                                  BoxId.level,
                                  GameState.barrierMovement,
                                );
                              }
                            },
                            itemBuilder: (context, index) => Text(
                              ["Easy", "Medium", "Hard"][index],
                              style: TextStyle(
                                color: GameState.background ==
                                        "assets/images/background-0.png"
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            difficultySelectorController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GameButton(
              onPress: () {
                Navigator.pop(context);
              },
              text: "Back",
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}
