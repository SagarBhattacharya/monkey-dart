enum TokenType {
  illegal,
  eof,

  identifier,
  integer,

  assign,
  plus,
  comma,
  semicolon,
  oparen,
  cparen,
  obrace,
  cbrace,
  minus,
  bang,
  asterisk,
  slash,
  less,
  great,
  lesseq,
  greateq,
  equals,
  notEquals,

  function,
  let,
  if_,
  else_,
  return_,
  true_,
  false_,
}

class Token {
  final TokenType type;
  final String? literal;

  Token({required this.type, this.literal});

  static const Map<String, TokenType> _keywords = {
    "fn": TokenType.function,
    "let": TokenType.let,
    "if": TokenType.if_,
    "else": TokenType.else_,
    "return": TokenType.return_,
    "true": TokenType.true_,
    "false": TokenType.false_,
  };

  static Token identifier(String literal) {
    if (_keywords.containsKey(literal)) {
      return Token(type: _keywords[literal]!);
    } else {
      return Token(type: TokenType.identifier, literal: literal);
    }
  }

  static Token illegal(String literal) {
    return Token(type: TokenType.illegal, literal: literal);
  }

  static Token number(String literal) {
    return Token(type: TokenType.integer, literal: literal);
  }

  @override
  String toString() => "${type.name}(${literal ?? ""})";
}
