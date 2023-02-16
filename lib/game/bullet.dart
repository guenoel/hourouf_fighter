import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';
import 'package:hourouf_fighter/game/enemy.dart';
import 'package:hourouf_fighter/game_manager.dart';

class Bullet extends SpriteAnimationComponent
    with HasGameRef<GameManager>, HasHitboxes, Collidable {
  final double _speed = 450;
  var hitboxRectangle = HitboxRectangle();
  int letterBulletId = 0;

  Bullet(this.letterBulletId);

  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('sprite_letters.png'),
        srcSize: Vector2(256.0, 256.0));
    animation = spriteSheet.createAnimation(row: letterBulletId, stepTime: 0.2);
    //sprite = await gameRef.loadSprite('bullet$letterBulletId.png');
    width = 128;
    height = 128;
    anchor = Anchor.center;
    addHitbox(hitboxRectangle);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      removeFromParent();
      removeHitbox(hitboxRectangle);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(-1, 0) * _speed * (dt / 2);

    if (position.x < 0) {
      removeFromParent();
      removeHitbox(hitboxRectangle);
    }
  }
}
