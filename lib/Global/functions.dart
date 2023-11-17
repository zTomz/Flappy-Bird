import 'package:flappy_bird/global/constant.dart';
import 'package:flappy_bird/layouts/widgets/game_button.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flappy_bird/database/database.dart';

BoxDecoration frame() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.black, width: 2),
    color: Colors.white54,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.6),
        blurRadius: 1.0,
        offset: const Offset(5, 5),
      ),
    ],
  );
}

BoxDecoration background(String imagePath) {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage(imagePath),
      fit: BoxFit.fill,
    ),
  );
}

AlertDialog dialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    actionsPadding: const EdgeInsets.only(right: 8, bottom: 8),
    title: const Text(
      "About Flappy Bird",
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
      ),
    ),
    content: const Text(
      Str.about,
      style: TextStyle(fontFamily: "Magic4"),
    ),
    actions: [
      GameButton(
        onPress: () {
          Navigator.pop(context);
        },
        text: "Okay",
        color: Colors.deepOrange,
      ),
    ],
  );
}

void init() {
  if (Database.read(BoxId.score) != null) {
    GameState.topScore = Database.read(BoxId.score);
  } else {
    Database.write(BoxId.score, GameState.topScore);
  }
  if (Database.read(BoxId.background) != null) {
    GameState.background = Database.read(BoxId.background);
  } else {
    Database.write(BoxId.background, GameState.background);
  }
  if (Database.read(BoxId.bird) != null) {
    GameState.bird = Database.read(BoxId.bird);
  } else {
    Database.write(BoxId.bird, GameState.bird);
  }
  if (Database.read(BoxId.level) != null) {
    GameState.barrierMovement = Database.read(BoxId.level);
  } else {
    Database.write(BoxId.level, GameState.barrierMovement);
  }
  if (Database.read(BoxId.audio) != null) {
    GameState.playMusic = Database.read(BoxId.audio);
  } else {
    Database.write(BoxId.audio, GameState.playMusic);
  }
  if (GameState.playMusic) {
    GameState.player.play(AssetSource("audio/Tintin.mp3"));
  } else {
    GameState.player.stop();
  }

  GameState.player.setReleaseMode(ReleaseMode.loop);
}

void navigate(context, navigate) {
  switch (navigate) {
    case Str.gamePage:
      Navigator.pushNamed(context, Str.gamePage);
      break;
    case Str.settings:
      Navigator.pushNamed(context, Str.settings);
      break;
    case Str.rateUs:
      Navigator.pushNamed(context, Str.rateUs);
      break;
  }
}
