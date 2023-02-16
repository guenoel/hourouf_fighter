import 'dart:ui';

import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:hourouf_fighter/game/enemy.dart';
import 'package:hourouf_fighter/game/game_screen.dart';

import '../game_manager.dart';

enum PlayerState {
  idle,
  attack,
  ball,
}

class Player extends SpriteAnimationGroupComponent<PlayerState>
    with HasGameRef<GameManager>, HasHitboxes, Collidable {
  final VoidCallback onTouch;
  //late SpriteSheet spriteSheet;
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation attackAnimation;
  late final SpriteAnimation ballAnimation;

  Player(this.onTouch);

  @override
  Future<void>? onLoad() async {
    // idle animation
    // Faut remettre les sprites a la meme textureSize
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
      PlayerState.attack: attackAnimation,
      PlayerState.idle: idleAnimation,
      PlayerState.ball: ballAnimation,
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

    position = (gameRef.size - Vector2(162, 86)) + Vector2(-40, -130);
    width = 162;
    height = 300;
    anchor = Anchor.centerLeft;

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

  // void animationChange (SpriteAnimation anim) async {
  //   animation = anim;
  //
  // }
}
