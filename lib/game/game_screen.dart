import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:hourouf_fighter/common/background.dart';
import 'package:hourouf_fighter/game_manager.dart';
import 'bullet.dart';
import 'enemy.dart';
import 'explosion.dart';
import 'player.dart';
import 'button.dart';

class GameScreen extends Component with HasGameRef<GameManager> {
  static const int playerLevelByScore = 20;
  late Player _player;
  late TextComponent _playerScore;
  late Timer enemySpawner;
  int score = 0;
  FireButton fireButton0 = FireButton(0, 0);
  FireButton fireButton1 = FireButton(1, 1);
  FireButton fireButton2 = FireButton(2, 2);
  FireButton fireButton3 = FireButton(3, 3);
  FireButton fireButton4 = FireButton(4, 4);
  FireButton fireButton5 = FireButton(5, 5);

  Random randomEnemy = Random();

  @override
  Future<void>? onLoad() {
    enemySpawner = Timer(2, onTick: _spawnEnemy, repeat: true);

    add(Background(50));
    add(fireButton0);
    add(fireButton1);
    add(fireButton2);
    add(fireButton3);
    add(fireButton4);
    add(fireButton5);

    _playerScore = TextComponent(
        text: "Score : 0",
        position: Vector2(gameRef.size.toRect().width / 2, 10),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 48.0,
            color: Colors.white,
          ),
        ));
    add(_playerScore);

    _player = Player(_onPlayerTouch);
    add(_player);
  }

  void spawnBullet(int letterBulletId) {
    var bullet = Bullet(letterBulletId);
    bullet.position = _player.position.clone();
    add(bullet);
  }

  void _spawnEnemy() {
    add(Enemy(_onEnemyTouch, randomEnemy.nextInt(2)));
  }

  void onTapDown() {
    print("Test");
  }

  void _onPlayerTouch() {
    gameRef.endGame(score);
  }

  void _onEnemyTouch(Vector2 position) {
    var explosion = Explosion();
    explosion.position = position;
    add(explosion);
    score++;
    _playerScore.text = "Score : $score";

    if (score % playerLevelByScore == 0) {
      //pass
    }
  }

//je vais supprimer ca pour rester statique
  // void onPanUpdate(DragUpdateInfo info) {
  //   if (isMounted) {
  //     _player.move(info.delta.game);
  //   }
  // }

  @override
  void onMount() {
    super.onMount();
    enemySpawner.start();
  }

  @override
  void update(double dt) {
    if (fireButton0.fire) {
      spawnBullet(0);
      fireButton0.fire = false;
    }
    if (fireButton1.fire) {
      spawnBullet(1);
      fireButton1.fire = false;
    }
    super.update(dt);
    enemySpawner.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();
    enemySpawner.stop();
  }
}
