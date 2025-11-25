import 'package:cs_beldex/cs_beldex.dart';
import 'package:test/test.dart';

void main() {
  group("$MinConfirms", () {
    test("contains two values", () {
      expect(MinConfirms.values.length, 2);
    });

    test("each confirmation type has the correct associated value", () {
      expect(MinConfirms.beldex.value, 10);
    });

    test("values are accessible by index", () {
      expect(MinConfirms.values[0], MinConfirms.beldex);
    });

    test("toString returns correct value", () {
      expect(MinConfirms.beldex.toString(), "MinConfirms.beldex");
    });
  });
}