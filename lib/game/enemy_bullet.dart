import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:hourouf_fighter/game/enemy.dart';
import 'package:hourouf_fighter/game/player_bullet.dart';
import 'package:hourouf_fighter/game_manager.dart';

enum EnemyBulletState {
  letters,
  fire,
}

class EnemyBullet extends SpriteAnimationGroupComponent
    with HasGameRef<GameManager>, GestureHitboxes, CollisionCallbacks {
  double _speed = 100;
  final Function(Vector2) onTouch;
  var hitboxRectangle = RectangleHitbox();
  late int letterEnemyId;
  late final SpriteAnimation letterAnimation;
  late final SpriteAnimation fireAnimation;

  EnemyBullet(this.onTouch, this.letterEnemyId);

  @override
  Future<void> onLoad() async {
    var letterBulletSheet = SpriteSheet(
        image: await Flame.images.load('sprite_letters.png'),
        srcSize: Vector2(256.0, 256.0));
    letterAnimation =
        letterBulletSheet.createAnimation(row: letterEnemyId, stepTime: 0.2);

    var fireBulletSheet = SpriteSheet(
        image: await Flame.images.load('fireball.png'),
        srcSize: Vector2(32.0, 32.0));
    fireAnimation = fireBulletSheet.createAnimation(row: 0, stepTime: 0.2);

    var size = 128.0;
    width = size;
    height = size;
    anchor = Anchor.center;
    add(hitboxRectangle);

    animations = {
      EnemyBulletState.letters: letterAnimation,
      EnemyBulletState.fire: fireAnimation,
    };
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    print('collision enemyBullet');
    if (other is PlayerBullet && letterEnemyId == other.letterBulletId) {
      print('playerBullet touche enemybullet');
      _speed = _speed * (-2);
      onTouch.call(other.position);
    }
    if (other is Enemy) {
      removeFromParent();
      remove(hitboxRectangle);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += Vector2(1, 0) * _speed * dt;
    if (position.x > gameRef.size.x) {
      removeFromParent();
      remove(hitboxRectangle);
    }
  }
}
