import 'package:flutter/material.dart';
import 'package:flappy_bird/database/database.dart';
import 'package:flappy_bird/global/constant.dart';
import 'package:flappy_bird/layouts/widgets/game_button.dart';

class DifficultySettings extends StatelessWidget {
  const DifficultySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.026),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "Difficulty",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GameButton(
                onPress: () {
                  GameState.barrierMovement = 0.05;
                  Database.write(BoxId.level, GameState.barrierMovement);
                },
                text: "Easy",
                color: Colors.green.shade300,
              ),
              GameButton(
                onPress: () {
                  GameState.barrierMovement = 0.08;
                  Database.write(BoxId.level, GameState.barrierMovement);
                },
                text: "Medium",
                color: Colors.yellow.shade700,
              ),
              GameButton(
                onPress: () {
                  GameState.barrierMovement = 0.1;
                  Database.write(BoxId.level, GameState.barrierMovement);
                },
                text: "Hard",
                color: Colors.red.shade300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
