import 'dart:ui';

import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:spaceshooter/game/enemy.dart';

import '../game_manager.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<GameManager>, HasHitboxes, Collidable {
  final VoidCallback onTouch;

  Player(this.onTouch);

  @override
  Future<void>? onLoad() async {
    var spriteSheet = SpriteSheet(
        image: await Images().load('player.png'), srcSize: Vector2(32.0, 48.0));
    animation = spriteSheet.createAnimation(row: 0, stepTime: 0.2);

    //position = 0, ((gameRef.size.toRect().height - size) / 2).toDouble();
    position = (gameRef.size - spriteSheet.srcSize) + Vector2(-40, -180);
    width = 40;
    height = 60;
    anchor = Anchor.center;

    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is Enemy) {
      onTouch.call();
    }
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
