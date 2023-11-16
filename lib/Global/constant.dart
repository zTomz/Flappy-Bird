// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';

class GameState {
  /// SCORE Variables calculated in function [startGame] in [GamePage]
  static int score = 0;
  static int topScore = 0;

  /// [Bird] Variables
  static double yAxis = 0;

  /// Variables to calculate bird movements function [startGame] in [GamePage]
  static double time = 0;
  static double height = 0;
  static double gravity = -3.9; // How strong the Gravity
  static double velocity = 2.5; // How strong the jump
  static double initialHeight = yAxis;
  static bool gameHasStarted = false;

  /// [Barrier] Variables
  static List<double> barrierX = [2, 3.4];
  static double barrierWidth = 0.5;
  static List<List<double>> barrierHeight = [
    // TODO: list of Lists to make different height for the barrier [topHeight,bottomHeight]
    [0.6, 0.4],
    [0.4, 0.6],
  ];
  static double barrierMovement = 0.05;

  /// Screen Boundary
  static double screenEnd = -1.9;
  static double screenStart = 3.5;

  /// audio
  static final player = AudioPlayer();
  static bool play = true;
}

class Str {
  static const String home = "/";
  static const String gamePage = "game";
  static const String rateUs = "rate";
  static const String settings = "settings";
  static const String about = "The game is a side-scroller where the player"
      " controls a bird, attempting to fly between "
      " columns of green pipes without hitting them";

  static String image = "0";
  static String bird = "assets/pics/bird.png";
}
