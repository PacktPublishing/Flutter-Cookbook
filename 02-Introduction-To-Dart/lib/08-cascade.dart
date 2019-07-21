class Url {
  String scheme;
  String host;
  String path;
  String body;

  @override
  String toString() {
    return '$scheme://$host/$path';
  }
}

void cascadePlayground() {
  final url = Url()
    ..scheme = 'https'
    ..host = 'dart.dev'
    ..path = '/guides/language/language-tour#cascade-notation-';

  print(url);

  // You can even use this operator with objects not designed to be builders.
  final largest = [342, 23423, 53, 232, 534]
    ..insert(0, 10)
    ..sort((a, b) => a.compareTo(b));

  print('The largest number in the list is ${largest.last}');
}
