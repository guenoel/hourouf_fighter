import 'dart:math';

import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';

import '../game_manager.dart';
import 'bullet.dart';

class Enemy extends SpriteAnimationComponent
    with HasGameRef<GameManager>, HasHitboxes, Collidable {
  final double _speed = 100;
  final Function(Vector2) onTouch;
  var hitboxRectangle = HitboxRectangle();
  late int letterEnemyId;

  Enemy(this.onTouch, this.letterEnemyId);

  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('sprite_letters.png'),
        srcSize: Vector2(256.0, 256.0));
    animation = spriteSheet.createAnimation(row: letterEnemyId, stepTime: 0.2);
    var size = 128.0;
    //position =
    //    Vector2(0, ((gameRef.size.toRect().height - size) / 2).toDouble());
    position = Vector2(size, 220.0);
    width = size;
    height = size;
    anchor = Anchor.center;

    addHitbox(hitboxRectangle);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is Bullet && letterEnemyId == other.letterBulletId) {
      removeFromParent();
      removeHitbox(hitboxRectangle);
      onTouch.call(other.position);
    }
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(1, 0) * _speed * dt;
    if (position.x > gameRef.size.x) {
      removeFromParent();
      removeHitbox(hitboxRectangle);
    }
  }
}
