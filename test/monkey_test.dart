import 'package:monkey/monkey.dart';
import 'package:test/test.dart';

void main() {
  test("single-byte tokens", () {
    final input = "=+(){},;";
    final output = [
      "assign()",
      "plus()",
      "oparen()",
      "cparen()",
      "obrace()",
      "cbrace()",
      "comma()",
      "semicolon()",
    ];

    final tokenizer = Tokenizer(source: input);

    for (String out in output) {
      final token = tokenizer.nextToken();
      expect(token.toString(), out);
    }
  });
}
