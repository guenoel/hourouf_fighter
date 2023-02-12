import 'package:flame/components.dart';
import 'package:flame/input.dart';
import '../game_manager.dart';

class FireButton extends SpriteComponent
    with Tappable, HasGameRef<GameManager> {
  final Vector2 buttonSize = Vector2(50.0, 50.0);
  bool fire = false;
  int letterId = 0;
  int buttonNumber = 0;

  FireButton(this.letterId, this.buttonNumber);

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('$letterId.png');
    size = buttonSize;
    Vector2 buttonPosition = Vector2(
        GameManager.screenWidth * (0.8 - buttonNumber * 0.12),
        GameManager.screenHeight * 0.8);
    position = buttonPosition;
  }

  @override
  bool onTapDown(TapDownInfo info) {
    try {
      fire = true;
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
