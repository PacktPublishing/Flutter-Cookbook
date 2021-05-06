import 'package:meta/meta.dart';

// An immutable object
class Name {
  final String first;
  final String last;

  const Name(this.first, this.last);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Name &&
          runtimeType == other.runtimeType &&
          first == other.first &&
          last == other.last;

  @override
  int get hashCode => first.hashCode ^ last.hashCode;

  @override
  String toString() {
    return '$first $last';
  }

  // Dart has the factory pattern baked into the language
  factory Name.fromValues({
    String title,
    @required String first,
    @required String last,
  }) {
    // optional properties can be annotated @required,
    // but this is just for the IDE, not the language.
    // This can enforced with assert statements
    assert(first != null);
    assert(last != null);

    if (title != null) {
      return OfficialName(title, first, last);
    }

    return Name(first, last);
  }
}

// A subclass; also immutable
class OfficialName extends Name {
  // Private properties begin with an underscore
  final String _title;

  // You can add colons after constructor
  // to parse data or delegate to super
  const OfficialName(this._title, String first, String last)
      : super(first, last);

  @override
  String toString() {
    return '$_title. ${super.toString()}';
  }
}

// Abstract class in Dart can function the same as Interfaces/Protocols
abstract class Greeter {
  String sayHello();
}

// Mixins are like Protocol Extensions.
// Here you can define default behaviour
// The only difference if you do not have to define
// an interface beforehand
mixin DefaultedGreeter implements Greeter {
  String get name;

  @override
  String sayHello() {
    return 'Hello $name';
  }
}

// The 'with' keyword is how you conform to a mixin
class ConcreteGreeter with DefaultedGreeter {
  // Putting an underscore before a property
  // makes it private
  final Name _name;

  ConcreteGreeter(this._name);

  @override
  String get name => _name.toString();
}

void classPlayground() {
  final name = OfficialName('Mr', 'Francois', 'Rabelais');
  final greeter = ConcreteGreeter(name);
  final message = greeter.sayHello();
  print(message);
}
