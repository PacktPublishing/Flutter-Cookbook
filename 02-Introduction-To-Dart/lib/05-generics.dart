// A basic generic class
// This type can hold anything
class Optional<T> {
  final T _value;
  T get value => _value;

  const Optional(this._value);

  bool exists() => _value != null;
}

// A constrained generic class
// Only type that implement the printable interface
// can be used for this class
abstract class Loggable {
  void log();
}

class LoggableList<T extends Loggable> {
  final List<T> loggables;

  LoggableList(this.loggables);
  void printAll() {
    final Iterable<int> it = [1, 2, 3].where((_) => true);

    for (Loggable logable in loggables) {
      logable.log();
    }
  }
}

class LoggableString implements Loggable {
  final String text;

  const LoggableString(this.text);

  @override
  void log() {
    print(text);
  }
}

// A generic function.
// The type is defined between the name of the function
// and the parameter list
T adder<T extends num>(T a, T b) {
  return a + b;
}

void genericsPlayground() {
  final a = Optional<int>(10);
  final b = Optional<int>(100);
  final nothing = Optional<double>(null);
  print(a.value);
  print(b.value);
  print(nothing.exists());

  // Notice how dart is able to infer the generic type
  // You don't always have to be explicit
  final strings = List.generate(
    20,
    (i) => LoggableString(i.toRadixString(2)),
  );
  final list = LoggableList(strings);
  list.printAll();

  final sum = adder(a.value, b.value);
  print('Sum is a ${sum.runtimeType} and its value is $sum');
}
