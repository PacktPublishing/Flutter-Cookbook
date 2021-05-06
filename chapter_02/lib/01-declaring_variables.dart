// This a basic function called variablePlayground
// that returns a void, aka - nothing
void variablePlayground() {
  basicTypes();
  untypedVariables();
  typeInterpolation();
  immutableVariables();
}

// This should look familiar
// to Java developers
void basicTypes() {
  int four = 4;
  double pi = 3.14;
  num someNumber = 24601;
  bool yes = true;
  bool no = false;

  print(four);
  print(pi);
  print(someNumber);
  print(yes);
  print(no);
}

// This is a get out of jail free card
// from the Dart type systems
// It has its uses, but in most cases,
// it should be avoided
void untypedVariables() {
  dynamic something = 14.2;
  print(something.runtimeType);
}

// JavaScript developers should
// recognize this syntax
// Though unlike JavaScript, Dart will
// remember the type that is being assigned to
// these variables
void typeInterpolation() {
  var anInteger = 15;
  var aDouble = 27.6;
  var aBoolean = false;

  print(anInteger.runtimeType);
  print(anInteger);

  print(aDouble.runtimeType);
  print(aDouble);

  print(aBoolean.runtimeType);
  print(aBoolean);
}

// This is the preferred way to declare variables
// The `final` keyword will only allow you assign
// a variable once.
void immutableVariables() {
  final int immutableInteger = 5;
  final double immutableDouble = 0.015;

  // Type annotation is optional
  final interpolatedInteger = 10;
  final interpolatedDouble = 72.8;

  print(interpolatedInteger);
  print(interpolatedDouble);

  const aFullySealedVariable = true;
  print(aFullySealedVariable);
}
