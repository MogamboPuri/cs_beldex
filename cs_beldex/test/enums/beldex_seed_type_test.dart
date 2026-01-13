import 'package:cs_beldex/cs_beldex.dart';
import 'package:test/test.dart';

void main() {
  group("$BeldexSeedType", () {
    test("contains two values", () {
      expect(BeldexSeedType.values.length, 2);
    });

    test("values are correct", () {
      expect(BeldexSeedType.sixteen.index, 0);
      expect(BeldexSeedType.twentyFive.index, 1);
    });

    test("values are accessible by index", () {
      expect(BeldexSeedType.values[0], BeldexSeedType.sixteen);
      expect(BeldexSeedType.values[1], BeldexSeedType.twentyFive);
    });

    test("toString returns correct value", () {
      expect(BeldexSeedType.sixteen.toString(), "BeldexSeedType.sixteen");
      expect(BeldexSeedType.twentyFive.toString(), "BeldexSeedType.twentyFive");
    });
  });
}
