import 'dart:io';

import 'package:monkey/monkey.dart';

class Repl {
  final String prompt;

  Repl({required this.prompt});

  void run() {
    while (true) {
      stdout.write(prompt);
      final input = stdin.readLineSync();
      if (input == null) break;
      final tokenizer = Tokenizer(source: input);

      for (
        Token token = tokenizer.next();
        token.type != TokenType.eof;
        token = tokenizer.next()
      ) {
        print(token);
      }
    }
  }
}
