import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:hourouf_fighter/game/enemy_bullet.dart';

import '../game_manager.dart';

enum EnemyState {
  idle,
  attack,
  knocked,
  ball,
}

class Enemy extends SpriteAnimationGroupComponent<EnemyState>
    with HasGameRef<GameManager>, GestureHitboxes, CollisionCallbacks {
  final VoidCallback onEnemyTouch;
  //late SpriteSheet spriteSheet;
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation attackAnimation;
  late final SpriteAnimation knockedAnimation;
  //late final SpriteAnimation ballAnimation;

  Vector2 sizeEnemy = Vector2(
      (GameManager.screenHeight * 0.54) / 3, GameManager.screenHeight / 3);

  Enemy(this.onEnemyTouch);

  @override
  Future<void> onLoad() async {
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

    // knocked animation
    var knockedData = SpriteAnimationData.sequenced(
        amount: 7, stepTime: 0.1, textureSize: Vector2(100, 100));
    var knockedImage = await Flame.images.load('Goten_knocked_100.png');
    knockedAnimation = SpriteAnimation.fromFrameData(knockedImage, knockedData);

    // ball animation
    // var ballData = SpriteAnimationData.sequenced(
    //     amount: 3, stepTime: 0.4, textureSize: Vector2(54, 100));
    // var ballImage = await Flame.images.load('sprite_x4_Goku.png');
    // ballAnimation = SpriteAnimation.fromFrameData(ballImage, ballData);

    animations = {
      EnemyState.attack: attackAnimation,
      EnemyState.idle: idleAnimation,
      EnemyState.knocked: knockedAnimation,
      //EnemyState.ball: ballAnimation,
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
    size = sizeEnemy;
    position = Vector2(
        GameManager.screenWidth / 20, GameManager.screenHeight - size.y);
    anchor = Anchor.centerLeft;

    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is EnemyBullet) {
      onEnemyTouch.call();
    }
  }

  // void move(Vector2 delta) {
  //   position.add(delta);
  // }

  // void animationChange (SpriteAnimation anim) async {
  //   animation = anim;
  //
  // }
}
