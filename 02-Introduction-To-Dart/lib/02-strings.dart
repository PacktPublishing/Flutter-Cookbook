void stringPlayground() {
  basicStringDeclaration();
  multiLineStrings();
  combiningStrings();
}

void basicStringDeclaration() {
  // With Single Quotes
  print('Single quotes');
  final aBoldStatement = 'Dart isn\'t loosely typed.';
  print(aBoldStatement);

  // With Double Quotes
  print("Hello, World");
  final aMoreMildOpinion = "Dart's popularity has skyrocketed with Flutter!";
  print(aMoreMildOpinion);

  // Combining single and double quotes
  final mixAndMatch =
      'Every programmer should write "Hello, World" when learning a new language.';
  print(mixAndMatch);
}

void multiLineStrings() {
  final withEscaping = 'One Fish\nTwo Fish\nRed Fish\nBlue Fish';
  print(withEscaping);

  final hamlet = '''
  To be, or not to be, that is the question:
  Whether 'tis nobler in the mind to suffer
  The slings and arrows of outrageous fortune,
  Or to take arms against a sea of troubles
  And by opposing end them.
  ''';

  print(hamlet);
}

void combiningStrings() {
  traditionalConcatenation();
  modernInterpolation();
}

void traditionalConcatenation() {
  final hello = 'Hello';
  final world = "world";

  final combined = hello + ' ' + world;

  print(combined);
}

void modernInterpolation() {
  final year = 2011;
  final interpolated = 'Dart was announced in $year.';
  print(interpolated);

  final age = 35;
  final howOld = 'I am $age ${age == 1 ? 'year' : 'years'} old.';
  print(howOld);
}
