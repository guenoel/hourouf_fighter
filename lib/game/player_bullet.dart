import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:letter_fighter/game/enemy_bullet.dart';
import 'package:letter_fighter/game_manager.dart';

class PlayerBullet extends SpriteAnimationComponent
    with HasGameRef<GameManager>, GestureHitboxes, CollisionCallbacks {
  final double _speed = 450;
  var hitboxRectangle = RectangleHitbox();
  int letterBulletId = 0;

  PlayerBullet(this.letterBulletId) : super() {
    //debugMode = true;
  }

  @override
  Future<void> onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Flame.images.load('sprite_letters2.png'),
        srcSize: Vector2(256.0, 256.0));
    animation = spriteSheet.createAnimation(row: letterBulletId, stepTime: 0.2);
    //sprite = await gameRef.loadSprite('bullet$letterBulletId.png');
    var size = GameManager.screenHeight / 5;
    width = size;
    height = size;
    anchor = Anchor.center;
    add(hitboxRectangle);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is EnemyBullet) {
      removeFromParent();
      remove(hitboxRectangle);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(-1, 0) * _speed * (dt / 2);
    if (position.x < 0) {
      removeFromParent();
      remove(hitboxRectangle);
    }
  }
}
