import 'beldex/chinese_simplified.dart';
import 'beldex/dutch.dart';
import 'beldex/english.dart' as beldex;
import 'beldex/french.dart';
import 'beldex/german.dart';
import 'beldex/italian.dart';
import 'beldex/japanese.dart';
import 'beldex/portuguese.dart';
import 'beldex/russian.dart';
import 'beldex/spanish.dart';

List<String> getBeldexWordList(String language) {
  switch (language.toLowerCase()) {
    case 'english':
      return beldex.EnglishMnemonics.words;
    case 'chinese (simplified)':
      return ChineseSimplifiedMnemonics.words;
    case 'dutch':
      return DutchMnemonics.words;
    case 'german':
      return GermanMnemonics.words;
    case 'japanese':
      return JapaneseMnemonics.words;
    case 'portuguese':
      return PortugueseMnemonics.words;
    case 'russian':
      return RussianMnemonics.words;
    case 'spanish':
      return SpanishMnemonics.words;
    case 'french':
      return FrenchMnemonics.words;
    case 'italian':
      return ItalianMnemonics.words;
    default:
      return beldex.EnglishMnemonics.words;
  }
}