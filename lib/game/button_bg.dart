import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import '../game_manager.dart';

class ButtonBg extends SpriteAnimationComponent
    with Tappable, HasGameRef<GameManager> {
  final Vector2 buttonSize = Vector2.all(60);
  bool fire = false;
  int buttonNum = 0;

  ButtonBg(this.buttonNum) : super() {
    debugMode = true;
  }

  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Flame.images.load('fireball.png'),
        srcSize: Vector2(32.0, 32.0));
    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.2);
    size = buttonSize;
    Vector2 buttonPosition = Vector2(
        GameManager.screenWidth * (0.8 - buttonNum * 0.14),
        GameManager.screenHeight - size.length);
    position = buttonPosition;
  }
}

// class BackGroundButton extends SpriteComponent with HasGameRef<GameManager> {
//   int letterId = 0;
//   int letterBulletId = 0;
//   final Vector2 buttonSize = Vector2(50.0, 50.0);

//   BackGroundButton(this.letterId, this.letterBulletId);

//   @override
//   Future<void>? onLoad() async {
//     size = buttonSize;
//     Vector2 buttonPosition = Vector2(
//         GameManager.screenWidth * (0.8 - letterBulletId * 0.12),
//         GameManager.screenHeight * 0.8);
//     position = buttonPosition;
//     sprite = await gameRef.loadSprite('fireball.png');
//     return super.onLoad();
//   }
// }
