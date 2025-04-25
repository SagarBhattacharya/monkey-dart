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
  function,
  let,
}

class Token {
  final TokenType type;
  final String? literal;

  Token({required this.type, this.literal});

  @override
  String toString() => "${type.name}(${literal ?? ""})";
}
