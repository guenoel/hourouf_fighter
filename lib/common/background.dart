import 'package:flame/components.dart';
import 'package:hourouf_fighter/common/star.dart';
import 'package:hourouf_fighter/game_manager.dart';

class Background extends Component with HasGameRef<GameManager> {
  int nbStars;

  Background(this.nbStars);

  @override
  Future<void>? onLoad() {
    for (int i = 0; i < nbStars; i++) {
      add(Star());
    }
  }
}
