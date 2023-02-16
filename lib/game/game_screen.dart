import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:hourouf_fighter/common/background.dart';
import 'package:hourouf_fighter/game/button2.dart';
import 'package:hourouf_fighter/game/enemy.dart';
import 'package:hourouf_fighter/game_manager.dart';
import 'bullet.dart';
import 'enemy_bullet.dart';
import 'explosion.dart';
import 'player.dart';
import 'button.dart';

class GameScreen extends Component with HasGameRef<GameManager> {
  static const int playerLevelByScore = 20;
  late Player _player;
  late Enemy _enemy;
  late TextComponent _playerScore;
  late Timer enemySpawner;
  late int randomEnemySelected;
  int score = 0;
  int numberOfButtons = 5;
  late List<FireButton> fireButtons;

  FireButton fireButton0 = FireButton(0, 0);
  FireButton fireButton1 = FireButton(1, 0);
  FireButton fireButton2 = FireButton(2, 0);
  FireButton fireButton3 = FireButton(3, 0);
  FireButton fireButton4 = FireButton(4, 0);
  FireButton fireButton5 = FireButton(5, 0);

  Random randomEnemy = Random();
  int actualEnemy = 0;

  @override
  Future<void>? onLoad() {
    add(ImageBackground());
    enemySpawner = Timer(3, onTick: _spawnEnemy, repeat: true);

    fireButtons = [
      fireButton0,
      fireButton1,
      fireButton2,
      fireButton3,
      fireButton4,
      fireButton5
    ];

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
    _enemy = Enemy();
    add(_enemy);
  }

  void spawnBullet(int letterBulletId) {
    var bullet = Bullet(letterBulletId);
    bullet.position = _player.position.clone();
    Future.delayed(const Duration(milliseconds: 400), () {
      add(bullet);
    });
  }

  void _spawnEnemy() {
    actualEnemy = randomEnemy.nextInt(27);
    enemyAttackAnimation();
    FlameAudio.play('$actualEnemy.mp3');
    add(EnemyBullet(_onBulletEnemyTouch, actualEnemy));
    for (int i = 0; i < numberOfButtons; i++) {
      remove(fireButtons[i]);
    }
    prepareButtons();
  }

  void prepareButtons() {
    for (int i = 0, r = Random().nextInt(numberOfButtons);
        i < numberOfButtons;
        i++) {
      if (i == r) {
        print(r);
        print("Actual enemey is : ");
        print(actualEnemy);
        fireButtons[i] = FireButton(i, actualEnemy);
      } else {
        randomEnemySelected = randomEnemy.nextInt(27);
        fireButtons[i] = FireButton(i, randomEnemySelected);
        while (randomEnemySelected == actualEnemy) {
          randomEnemySelected = randomEnemy.nextInt(27);
        }
      }
      add(fireButtons[i]);
    }
  }

  void onTapDown() {
    print("Test");
  }

  void _onPlayerTouch() {
    gameRef.endGame(score);
    //FlameAudio.bgm.play('DragonBallArabicOpening.mp3');
  }

  void _onBulletEnemyTouch(Vector2 position) {
    var explosion = Explosion();
    explosion.position = position;
    add(explosion);
    score++;
    _playerScore.text = "Score : $score";

    if (score % playerLevelByScore == 0) {
      //pass
    }
  }

  //Faut trouver une autre facon de remettre idle après une attaque
  void playerAttackAnimation() {
    _player.current = PlayerState.attack;
    Future.delayed(const Duration(milliseconds: 600), () {
      _player.current = PlayerState.idle;
    });
  }

  //Faut trouver une autre facon de remettre idle après une attaque
  void enemyAttackAnimation() {
    _enemy.current = EnemyState.attack;
    Future.delayed(const Duration(milliseconds: 600), () {
      _enemy.current = EnemyState.idle;
    });
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
    for (int i = 0; fireButtons.length > i; i++) {
      if (fireButtons[i].fire) {
        spawnBullet(fireButtons[i].letterBulletId);
        fireButtons[i].fire = false;
        playerAttackAnimation();
      }
    }
    super.update(dt / 2);
    enemySpawner.update(dt / 2);
  }

  @override
  void onRemove() {
    super.onRemove();
    enemySpawner.stop();
  }
}
