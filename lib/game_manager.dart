import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'game/game_screen.dart';
import 'main/main_screen.dart';
import 'package:flame/components.dart';

class GameManager extends FlameGame
    with HasCollidables, MultiTouchTapDetector, HasTappables {
  late GameScreen _gameScreen;
  late MainScreen _mainScreen;
  static double screenWidth = 0;
  static double screenHeight = 0;

  bool running = true;
  //constructeur de GameManager
  GameManager() {
    //instanciation de Mainscreen
    _gameScreen = GameScreen();
    _mainScreen = MainScreen();
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

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    super.onTapDown(pointerId, info);
    if (_mainScreen.isMounted == true) {
      print("It is calling again ?");
      remove(_mainScreen);
      _gameScreen = GameScreen();
      add(_gameScreen);
    }
  }
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
//}
