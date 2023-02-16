import 'dart:ui';

import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:hourouf_fighter/game/enemy_bullet.dart';
import 'package:hourouf_fighter/game/game_screen.dart';

import '../game_manager.dart';

enum EnemyState {
  idle,
  attack,
  ball,
}

class Enemy extends SpriteAnimationGroupComponent<EnemyState>
    with HasGameRef<GameManager>, HasHitboxes, Collidable {
  //final VoidCallback onTouch;
  //late SpriteSheet spriteSheet;
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation attackAnimation;
  late final SpriteAnimation ballAnimation;

  //Enemy(this.onTouch);

  @override
  Future<void>? onLoad() async {
    // idle animation
    var idleData = SpriteAnimationData.sequenced(
        amount: 2, stepTime: 0.4, textureSize: Vector2(54, 100));
    var idleImage = await Flame.images.load('Goku_idle.png');
    idleAnimation = SpriteAnimation.fromFrameData(idleImage, idleData);

    // run animation
    var attackData = SpriteAnimationData.sequenced(
        amount: 2, stepTime: 0.3, textureSize: Vector2(54, 100));
    var attackImage = await Flame.images.load('Goku_attack.png');
    attackAnimation = SpriteAnimation.fromFrameData(attackImage, attackData);

    // ball animation
    var ballData = SpriteAnimationData.sequenced(
        amount: 3, stepTime: 0.4, textureSize: Vector2(54, 100));
    var ballImage = await Flame.images.load('sprite_x4_Goku.png');
    ballAnimation = SpriteAnimation.fromFrameData(ballImage, ballData);

    animations = {
      EnemyState.attack: attackAnimation,
      EnemyState.idle: idleAnimation,
      EnemyState.ball: ballAnimation,
    };

    current = EnemyState.idle;

    // spriteSheet = SpriteSheet(
    //     image: await Images().load('sprite_x4_Goku.png'),
    //     srcSize: Vector2(100.0, 100.0));

    // animationIdle = spriteSheet.createAnimation(
    //   row: 0,
    //   stepTime: 0.4,
    // );

    // animationAttack =
    //     spriteSheet.createAnimation(row: 1, stepTime: 0.4, loop: false);

    // animationBall = spriteSheet.createAnimation(row: 2, stepTime: 0.4);

    //position = 0, ((gameRef.size.toRect().height - size) / 2).toDouble();

    position = Vector2(0, 220);
    width = 162;
    height = 300;
    anchor = Anchor.centerLeft;

    addHitbox(HitboxRectangle());
  }

  // @override
  // void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
  //   super.onCollision(intersectionPoints, other);
  //   if (other is EnemyBullet) {
  //     onTouch.call();
  //   }
  // }

  void move(Vector2 delta) {
    position.add(delta);
  }

  // void animationChange (SpriteAnimation anim) async {
  //   animation = anim;
  //
  // }
}
