import 'package:monkey/monkey.dart';

class Tokenizer {
  final String source;
  int current = 0;
  int next = 0;
  String symbol = "\0";

  Tokenizer({required this.source}) {
    _readChar();
  }

  void _readChar() {
    if (next >= source.length) {
      symbol = "\0";
    } else {
      symbol = source[next];
    }
    current = next;
    next++;
  }

  Token nextToken() {
    final char = symbol;
    _readChar();
    switch (char) {
      case "=":
        return Token(type: TokenType.assign);
      case "+":
        return Token(type: TokenType.plus);
      case "(":
        return Token(type: TokenType.oparen);
      case ")":
        return Token(type: TokenType.cparen);
      case "{":
        return Token(type: TokenType.obrace);
      case "}":
        return Token(type: TokenType.cbrace);
      case ",":
        return Token(type: TokenType.comma);
      case ";":
        return Token(type: TokenType.semicolon);
      case "\0":
      case _:
        return Token(type: TokenType.eof);
    }
  }
}
