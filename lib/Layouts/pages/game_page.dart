import 'dart:async';

import 'package:flappy_bird/global/constant.dart';
import 'package:flappy_bird/global/functions.dart';
import 'package:flappy_bird/layouts/pages/start_screen_page.dart';
import 'package:flappy_bird/layouts/widgets/game_button.dart';
import 'package:flappy_bird/layouts/widgets/barrier.dart';
import 'package:flappy_bird/layouts/widgets/widget_bird.dart';
import 'package:flappy_bird/layouts/widgets/widget_cover.dart';
import 'package:flutter/material.dart';
import 'package:flappy_bird/database/database.dart';
import 'package:lottie/lottie.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: GameState.gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: background(GameState.background),
                child: Stack(
                  children: [
                    Bird(yAxis: GameState.yAxis),
                    // Tap to play text
                    Container(
                      alignment: const Alignment(0, -0.3),
                      child: Text(
                        GameState.gameHasStarted ? '' : 'TAP TO START',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Barrier(
                      barrierHeight: GameState.barrierHeight[0][0],
                      barrierWidth: GameState.barrierWidth,
                      direction: GameState.barrierX[0],
                      isTop: true,
                    ),
                    Barrier(
                      barrierHeight: GameState.barrierHeight[0][1],
                      barrierWidth: GameState.barrierWidth,
                      direction: GameState.barrierX[0],
                      isTop: false,
                    ),
                    Barrier(
                      barrierHeight: GameState.barrierHeight[1][0],
                      barrierWidth: GameState.barrierWidth,
                      direction: GameState.barrierX[1],
                      isTop: true,
                    ),
                    Barrier(
                      barrierHeight: GameState.barrierHeight[1][1],
                      barrierWidth: GameState.barrierWidth,
                      direction: GameState.barrierX[1],
                      isTop: false,
                    ),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      left: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Score : ${GameState.score}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ), // Best TEXT
                          Text(
                            "Best : ${GameState.topScore}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Cover(),
            ),
          ],
        ),
      ),
    );
  }

  // Jump Function:
  void jump() {
    setState(() {
      GameState.time = 0;
      GameState.initialHeight = GameState.yAxis;
    });
  }

  //Start Game Function:
  void startGame() {
    GameState.gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 35), (timer) {
      GameState.height = GameState.gravity * GameState.time * GameState.time +
          GameState.velocity * GameState.time;
      setState(() {
        GameState.yAxis = GameState.initialHeight - GameState.height;
      });
      /* <  Barriers Movements  > */
      setState(() {
        if (GameState.barrierX[0] < GameState.screenEnd) {
          GameState.barrierX[0] += GameState.screenStart;
        } else {
          GameState.barrierX[0] -= GameState.barrierMovement;
        }
      });
      setState(() {
        if (GameState.barrierX[1] < GameState.screenEnd) {
          GameState.barrierX[1] += GameState.screenStart;
        } else {
          GameState.barrierX[1] -= GameState.barrierMovement;
        }
      });
      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }
      GameState.time += 0.032;
    });
    /* <  Calculate Score  > */
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (birdIsDead()) {
        // Todo : save the top score in the database  <---
        Database.write(BoxId.score, GameState.topScore);
        timer.cancel();
        GameState.score = 0;
      } else {
        setState(() {
          if (GameState.score == GameState.topScore) {
            GameState.topScore++;
          }
          GameState.score++;
        });
      }
    });
  }

  /// Make sure the [Bird] doesn't go out screen & hit the barrier
  bool birdIsDead() {
    // Screen
    if (GameState.yAxis > 1.26 || GameState.yAxis < -1.1) {
      return true;
    }

    /// Barrier hitBox
    for (int i = 0; i < GameState.barrierX.length; i++) {
      if (GameState.barrierX[i] <= Bird.birdSize &&
          (GameState.barrierX[i] + (GameState.barrierWidth)) >= Bird.birdSize &&
          (GameState.yAxis <= -1 + GameState.barrierHeight[i][0] ||
              GameState.yAxis + Bird.birdSize >=
                  1 - GameState.barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      GameState.yAxis = 0;
      GameState.gameHasStarted = false;
      GameState.time = 0;
      GameState.score = 0;
      GameState.initialHeight = GameState.yAxis;
      GameState.barrierX[0] = 2;
      GameState.barrierX[1] = 3.4;
    });
  }

  // TODO: Alert Dialog with 2 options (try again, exit)
  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Text(
            "..Oops",
            style: TextStyle(
              color: Colors.blue[900],
              fontSize: 35,
            ),
          ),
          actionsPadding: const EdgeInsets.only(right: 8, bottom: 8),
          content: Container(
            child: Lottie.asset("assets/images/loss.json", fit: BoxFit.cover),
          ),
          actions: [
            GameButton(
              onPress: () {
                resetGame();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StartScreen(),
                  ),
                );
              },
              text: "Exit",
              color: Colors.grey,
            ),
            GameButton(
              onPress: () {
                resetGame();
              },
              text: "try again",
              color: Colors.green,
            ),
          ],
        );
      },
    );
  }
}
