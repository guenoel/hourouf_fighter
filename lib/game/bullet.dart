import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:hourouf_fighter/game/enemy.dart';
import 'package:hourouf_fighter/game_manager.dart';

class Bullet extends SpriteComponent
    with HasGameRef<GameManager>, HasHitboxes, Collidable {
  final double _speed = 450;
  var hitboxRectangle = HitboxRectangle();
  int letterBulletId = 0;

  Bullet(this.letterBulletId);

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite('bullet$letterBulletId.png');
    width = 32;
    height = 16;

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
    position += Vector2(-1, 0) * _speed * dt;

    if (position.x < 0) {
      removeFromParent();
      removeHitbox(hitboxRectangle);
    }
  }
}
