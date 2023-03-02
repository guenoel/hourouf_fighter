import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:letter_fighter/common/star.dart';
import 'package:letter_fighter/game_manager.dart';

class BackgroundIntro extends SpriteComponent with HasGameRef<GameManager> {
  int backgroundIntro;
  late String background;
  List<String> backgroundIntroList = [
    'DBZ_intro_Bg.png',
    'wallpaper_dbz.png',
  ];

  BackgroundIntro(this.backgroundIntro);

  @override
  Future<void>? onLoad() async {
    size = Vector2(GameManager.screenWidth, GameManager.screenWidth * 0.47);
    position = Vector2(0, 0);
    // if (backgroundId > backgroundList.length - 1) {
    //   backgroundId = backgroundList.length - 1;
    // }
    background = backgroundIntroList[backgroundIntro];
    sprite = await gameRef.loadSprite(background);
    return super.onLoad();
  }

  List<String> get bgIntroList {
    return backgroundIntroList;
  }

  // @override
  // void render(Canvas canvas) {
  //   ImageBackground
  //   super.render(canvas);
  // }
}
