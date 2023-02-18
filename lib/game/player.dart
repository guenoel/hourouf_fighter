import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:hourouf_fighter/game/enemy_bullet.dart';

import '../game_manager.dart';

enum PlayerState {
  idle,
  attack,
  knocked,
  ball,
}

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<GameManager>, GestureHitboxes, CollisionCallbacks {
  final VoidCallback onPlayerTouch;
  //late SpriteSheet spriteSheet;
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation attackAnimation;
  late final SpriteAnimation knockedAnimation;
  //late final SpriteAnimation ballAnimation;
  Vector2 sizePlayer =
      Vector2((GameManager.screenHeight) / 3, GameManager.screenHeight / 3);

  Player(this.onPlayerTouch);

  @override
  Future<void> onLoad() async {
    // idle animation
    var idleData = SpriteAnimationData.sequenced(
        amount: 2, stepTime: 0.4, textureSize: Vector2(100, 100));
    var idleImage = await Flame.images.load('Goten_idle_100.png');
    SpriteAnimation idleAnimation =
        SpriteAnimation.fromFrameData(idleImage, idleData);

    // attack animation
    var attackData = SpriteAnimationData.sequenced(
        amount: 2, stepTime: 0.3, textureSize: Vector2(100, 100));
    var attackImage = await Flame.images.load('Goten_attack_100.png');
    attackAnimation = SpriteAnimation.fromFrameData(attackImage, attackData);

    // knocked animation
    var knockedData = SpriteAnimationData.sequenced(
        amount: 7, stepTime: 0.1, textureSize: Vector2(100, 100));
    var knockedImage = await Flame.images.load('Goten_knocked_100.png');
    knockedAnimation = SpriteAnimation.fromFrameData(knockedImage, knockedData);

    // // ball animation
    // var ballData = SpriteAnimationData.sequenced(
    //     amount: 3, stepTime: 0.4, textureSize: Vector2(54, 100));
    // var ballImage = await Flame.images.load('sprite_x4_Goku.png');
    // ballAnimation = SpriteAnimation.fromFrameData(ballImage, ballData);

    animations = {
      PlayerState.attack: attackAnimation,
      PlayerState.idle: idleAnimation,
      //PlayerState.ball: ballAnimation,
      PlayerState.knocked: knockedAnimation,
    };

    current = PlayerState.idle;

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

    size = sizePlayer;
    anchor = Anchor.centerLeft;
    position = Vector2(
        (GameManager.screenWidth) - size.x, GameManager.screenHeight - size.y);

    add(RectangleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is EnemyBullet) {
      onPlayerTouch.call();
    }
  }

  // void move(Vector2 delta) {
  //   position.add(delta);
  // }
}
