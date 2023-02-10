import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/foundation.dart';
import '../game_manager.dart';
import 'game_screen.dart';
import 'package:flame/components.dart';

class DialogButton extends SpriteComponent
    with Tappable, HasGameRef<GameManager> {
  final Vector2 buttonSize = Vector2(50.0, 50.0);

  bool fire = false;
  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('button.png');
    size = buttonSize;
    position =
        Vector2(GameManager.screenWidth * 0.8, GameManager.screenHeight * 0.8);
  }

  @override
  bool onTapDown(TapDownInfo event) {
    print('Button tapped');

    try {
      fire = true;
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
