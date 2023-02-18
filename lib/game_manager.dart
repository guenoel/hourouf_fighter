import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';

import 'game/game_screen.dart';
import 'main/main_screen.dart';

class GameManager extends FlameGame
    with HasCollisionDetection, MultiTouchTapDetector, HasTappables {
  late GameScreen _gameScreen;
  late MainScreen _mainScreen;
  static double screenWidth = 0;
  static double screenHeight = 0;
  late Vector2 screenSize;

  bool running = true;
  GameManager() {
    _gameScreen = GameScreen();
    _mainScreen = MainScreen();
  }

  @override
  Future<void>? onLoad() {
    add(_mainScreen);
    screenSize = size;
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
      remove(_mainScreen);
      //FlameAudio.bgm.stop();
      _gameScreen = GameScreen();
      add(_gameScreen);
    }
  }
}

// @override
// void onDoubleTap() {
//  if (running) {
//    pauseEngine();
//  } else {
//    resumeEngine();
//  }

//  running = !running;
// }
// }
