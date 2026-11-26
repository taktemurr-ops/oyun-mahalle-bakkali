import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_mahalle_bakkali/oyun_mahalle_bakkali.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(mahalleBakkaliConfig.title.length, 33);
    expect(mahalleBakkaliConfig.tagline.length, 33);
    for (final s in mahalleBakkaliConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(mahalleBakkaliConfig.gameId, mahalleBakkaliId);
    expect(mahalleBakkaliRules.gameId, mahalleBakkaliId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(mahalleBakkaliRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: mahalleBakkaliId, optionalMechanics: mahalleBakkaliRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(mahalleBakkaliRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
