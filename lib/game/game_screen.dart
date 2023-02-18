import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:hourouf_fighter/common/background.dart';
import 'package:hourouf_fighter/game/enemy.dart';
import 'package:hourouf_fighter/game/lifebar.dart';
import 'package:hourouf_fighter/game_manager.dart';

import 'player_bullet.dart';
import 'enemy_bullet.dart';
import 'explosion.dart';
import 'player.dart';
import 'button.dart';

class GameScreen extends Component with HasGameRef<GameManager> {
  static const int playerLevelByScore = 3;

  late Player _player;
  late Enemy _enemy;
  late PlayerBullet _playerBullet;
  late TextComponent _levelScoreText;
  late TextComponent _enemyLifeText;
  late EnemyBullet _enemyBullet;
  late Timer enemySpawner;
  late int randomEnemySelected;
  int score = 0;
  int levelScore = 0;
  int lifePlayer = 3;
  int lifeEnemy = 3;
  late int actualLifeEnemy;
  int numberOfButtons = 6;
  late List<FireButton> fireButtons;
  late List<Life> lifeBalls;
  bool delay = false;
  late ImageBackground imageBackground = ImageBackground(0);

  FireButton fireButton0 = FireButton(0, 0);
  FireButton fireButton1 = FireButton(1, 0);
  FireButton fireButton2 = FireButton(2, 0);
  FireButton fireButton3 = FireButton(3, 0);
  FireButton fireButton4 = FireButton(4, 0);
  FireButton fireButton5 = FireButton(5, 0);

  Life lifeBall0 = Life(0);
  Life lifeBall1 = Life(1);
  Life lifeBall2 = Life(2);

  Random randomEnemy = Random();
  int actualEnemy = 0;

  @override
  Future<void>? onLoad() async {
    actualLifeEnemy = lifeEnemy;
    enemySpawner = Timer(3, onTick: _spawnEnemyBullet, repeat: true);

    fireButtons = [
      fireButton0,
      fireButton1,
      fireButton2,
      fireButton3,
      fireButton4,
      fireButton5
    ];

    lifeBalls = [
      lifeBall0,
      lifeBall1,
      lifeBall2,
    ];

    add(imageBackground);

    for (int i = 0; i < lifePlayer; i++) {
      add(lifeBalls[i]);
    }

    _levelScoreText = TextComponent(
        text: "Level : 0",
        position: Vector2(gameRef.size.toRect().width * 0.66,
            gameRef.size.toRect().height * 0.01),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 48.0,
            color: Colors.black,
          ),
        ));
    add(_levelScoreText);

    _enemyLifeText = TextComponent(
        text: "Life: $lifeEnemy",
        position: Vector2(gameRef.size.toRect().width * 0.1,
            gameRef.size.toRect().height * 0.01),
        anchor: Anchor.topCenter,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 48.0,
            color: Colors.black,
          ),
        ));
    add(_enemyLifeText);

    prepareButtons();

    _player = Player(_onPlayerTouch);
    add(_player);
    _enemy = Enemy(_onEnemyTouch);
    add(_enemy);
  }

  void spawnPlayerBullet(int letterBulletId) {
    _playerBullet = PlayerBullet(letterBulletId);
    _playerBullet.position = _player.position.clone() + Vector2(-1, 0);
    if (!delay) {
      Future.delayed(const Duration(milliseconds: 400), () {
        add(_playerBullet);
        delay = false;
      });
    }
  }

  void _spawnEnemyBullet() {
    actualEnemy = randomEnemy.nextInt(27);
    enemyAttackAnimation();
    FlameAudio.play('$actualEnemy.mp3');

    _enemyBullet = EnemyBullet(_onEnemyBulletTouch, actualEnemy);
    if (levelScore > 0) {
      _enemyBullet.current = EnemyBulletState.fire;
    } else {
      _enemyBullet.current = EnemyBulletState.letters;
    }

    //position d origine legerement décalée car condition de collision existante
    _enemyBullet.position =
        _enemy.position.clone() + Vector2(_enemy.sizeEnemy.x * 1.7, 0);
    // print('position d origine enemyBullet: ');
    // print(_enemyBullet.position);
    add(_enemyBullet);
    // print('enemyBullet montée ? : ');
    // print(_enemyBullet.isMounted);
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
        fireButtons[i] = FireButton(i, actualEnemy);
      } else {
        randomEnemySelected = randomEnemy.nextInt(27);
        fireButtons[i] = FireButton(i, randomEnemySelected);
        // Pourquoi 2 lettres identiques malgré cela ?
        while (randomEnemySelected == actualEnemy) {
          randomEnemySelected = randomEnemy.nextInt(27);
        }
      }
      add(fireButtons[i]);
    }
  }

  void _onPlayerTouch() {
    remove(_enemyBullet);
    playerKnockedAnimation();
    lifePlayer--;
    remove(lifeBalls[lifePlayer]);
    if (lifePlayer == 0) {
      gameRef.endGame(levelScore);
    }
    //FlameAudio.bgm.play('DragonBallArabicOpening.mp3');
  }

  //semblablable à _onEnemyBulletTouch et non à _onPlayerTouch
  void _onEnemyTouch() async {
    enemyKnockedAnimation();
    actualLifeEnemy--;
    _enemyLifeText.text = "Life : $actualLifeEnemy";
    score++;
    if (score % playerLevelByScore == 0) {
      levelScore++;
      int bgId = levelScore;
      if (bgId > imageBackground.bgList.length - 1) {
        bgId = imageBackground.bgList.length - 1;
      }
      imageBackground.sprite =
          await gameRef.loadSprite(imageBackground.bgList[bgId]);
      actualLifeEnemy = lifeEnemy;
      _enemyLifeText.text = "Life : $actualLifeEnemy";
      _levelScoreText.text = "Level : $levelScore";
    }
    if (levelScore >= 1) {
      //enemybullet image = fireball
    }
  }

  void _onEnemyBulletTouch(Vector2 position) {
    var explosion = Explosion();
    explosion.position = position - Vector2(_playerBullet.width / 2, 0);
    add(explosion);
  }

  //Faut trouver une autre facon de remettre idle après une attaque
  void playerAttackAnimation() {
    _player.current = PlayerState.attack;
    Future.delayed(const Duration(milliseconds: 600), () {
      _player.current = PlayerState.idle;
    });
  }

  //Faut trouver une autre facon de remettre idle après une attaque
  void playerKnockedAnimation() {
    _player.current = PlayerState.knocked;
    Future.delayed(const Duration(milliseconds: 700), () {
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

  //Faut trouver une autre facon de remettre idle après une attaque
  void enemyKnockedAnimation() {
    _enemy.current = EnemyState.knocked;
    Future.delayed(const Duration(milliseconds: 700), () {
      _enemy.current = EnemyState.idle;
    });
  }

  void enemyBulletLetterAnimation() {
    _enemyBullet.current = EnemyBulletState.letters;
  }

  void enemyBulletFireAnimation() {
    _enemyBullet.current = EnemyBulletState.fire;
  }

  @override
  void onMount() {
    super.onMount();
    enemySpawner.start();
  }

  @override
  void update(double dt) {
    for (int i = 0; fireButtons.length > i; i++) {
      if (fireButtons[i].fire) {
        spawnPlayerBullet(fireButtons[i].letterBulletId);
        fireButtons[i].fire = false;
        playerAttackAnimation();
        delay = true;
      }
    }
    super.update(dt / 2);
    enemySpawner.update(dt / 2);
  }

  ////Tentative de changement de background:
  // @override
  // void render(Canvas canvas) {
  //   int bgId = levelScore;
  //   if (levelScore > imageBackgrounds.length - 1) {
  //     bgId = imageBackgrounds.length - 1;
  //   }
  //   imageBackgrounds[bgId].render(canvas);
  //   super.render(canvas);
  // }

  @override
  void onRemove() {
    super.onRemove();
    enemySpawner.stop();
  }
}
