import 'package:monkey/monkey.dart';

class Tokenizer {
  final String source;
  int position = -1;
  String symbol = "\0";

  Tokenizer({required this.source}) {
    _advance();
  }

  void _advance() {
    if (position + 1 >= source.length) {
      symbol = "\0";
    } else {
      symbol = source[position + 1];
    }
    position++;
  }

  String _peek() {
    if (position + 1 >= source.length) {
      return "\0";
    } else {
      return source[position + 1];
    }
  }

  bool _isLetter(String char) => RegExp(r'[A-Za-z_]').hasMatch(char);
  bool _isDigit(String char) => RegExp(r'[0-9]').hasMatch(char);

  Token _identifier() {
    final pos = position;
    while (symbol != "\0" && _isLetter(symbol)) {
      _advance();
    }
    return Token.identifier(source.substring(pos, position));
  }

  Token _number() {
    final pos = position;
    while (symbol != "\0" && _isDigit(symbol)) {
      _advance();
    }
    return Token.number(source.substring(pos, position));
  }

  Token _twoCharTokens(String secondchar, TokenType type1, TokenType type2) {
    if (_peek() == secondchar) {
      _advance();
      return Token(type: type1);
    } else {
      return Token(type: type2);
    }
  }

  void _skipWhitespaces() {
    while (symbol != "\0" && symbol.trim().isEmpty) {
      _advance();
    }
  }

  Token next() {
    final Token token;
    _skipWhitespaces();
    switch (symbol) {
      case "+":
        token = Token(type: TokenType.plus);
      case "(":
        token = Token(type: TokenType.oparen);
      case ")":
        token = Token(type: TokenType.cparen);
      case "{":
        token = Token(type: TokenType.obrace);
      case "}":
        token = Token(type: TokenType.cbrace);
      case ",":
        token = Token(type: TokenType.comma);
      case ";":
        token = Token(type: TokenType.semicolon);
      case "-":
        token = Token(type: TokenType.minus);
      case "*":
        token = Token(type: TokenType.asterisk);
      case "/":
        token = Token(type: TokenType.slash);
      case "=":
        token = _twoCharTokens("=", TokenType.equals, TokenType.assign);
      case "<":
        token = _twoCharTokens("=", TokenType.lesseq, TokenType.less);
      case ">":
        token = _twoCharTokens("=", TokenType.greateq, TokenType.great);
      case "!":
        token = _twoCharTokens("=", TokenType.notEquals, TokenType.bang);
      case "\0":
        token = Token(type: TokenType.eof);
      case _:
        if (_isLetter(symbol)) {
          return _identifier();
        } else if (_isDigit(symbol)) {
          return _number();
        } else {
          token = Token.illegal(symbol);
        }
    }

    _advance();
    return token;
  }
}
