import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'game/game_screen.dart';
import 'main/main_screen.dart';

class GameManager extends FlameGame
    with HasCollidables, DoubleTapDetector, TapDetector {
  late GameScreen _gameScreen;
  late MainScreen _mainScreen;

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
  }

  @override
  void onDoubleTap() {
    super.onDoubleTap();
    _mainScreen.onDoubleTap();
  }

  // @override
  // void onPanStart(DragStartInfo info) {
  //   super.onPanStart(info);
  //   _mainScreen.onPanStart(info);
  // }

  // @override
  // void onPanUpdate(DragUpdateInfo info) {
  //   super.onPanUpdate(info);
  //   _gameScreen.onPanUpdate(info);
  // }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    _gameScreen.bulletSpawner;
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
