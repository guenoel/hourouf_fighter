import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'game/game_screen.dart';
import 'main/main_screen.dart';
import 'package:flame/components.dart';

class GameManager extends FlameGame with HasTappables, HasCollidables {
  late GameScreen _gameScreen;
  late MainScreen _mainScreen;
  static double screenWidth = 0;
  static double screenHeight = 0;

  bool running = true;

  GameManager() {
    _mainScreen = MainScreen(() {
      remove(_mainScreen);
      _gameScreen = GameScreen();
      add(_gameScreen);
    });
  }

  @override
  Future<void>? onLoad() {
    add(_mainScreen);
    screenWidth = size[0];
    screenHeight = size[1];
  }

  void endGame(int score) {
    remove(_gameScreen);
    _mainScreen.setScore(score);
    add(_mainScreen);
  }

  //@override
  //void onDoubleTap() {
  //  if (running) {
  //    pauseEngine();
  //  } else {
  //    resumeEngine();
  //  }
  //
  //  running = !running;
  //}
}
