import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:hourouf_fighter/common/background.dart';
import '../game_manager.dart';

class FireButton extends SpriteAnimationComponent
    with Tappable, HasGameRef<GameManager> {
  final Vector2 buttonSize = Vector2(50.0, 50.0);
  bool fire = false;
  int buttonNum = 0;
  int letterBulletId = 0;

  FireButton(this.buttonNum, this.letterBulletId);

  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('sprite_letters.png'),
        srcSize: Vector2(256.0, 256.0));
    animation = spriteSheet.createAnimation(row: letterBulletId, stepTime: 0.2);
    size = buttonSize;
    Vector2 buttonPosition = Vector2(
        GameManager.screenWidth * (0.8 - buttonNum * 0.12),
        GameManager.screenHeight * 0.8);
    position = buttonPosition;
    //sprite = await gameRef.loadSprite('$letterId.png');
  }

  @override
  bool onTapDown(TapDownInfo info) {
    try {
      print('button tapped');
      print(fire);
      fire = true;
      FlameAudio.play('$letterBulletId.mp3');
      return true;
    } catch (error) {
      print(error);
      return false;
    }
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
