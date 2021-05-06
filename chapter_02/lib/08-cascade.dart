class UrlBuilder {
  String scheme;
  String host;
  List<String> routes;

  @override
  String toString() {
    assert(scheme != null);
    assert(host != null);
    final paths = [host, if (routes != null) ...routes];
    final path = paths.join('/');

    return '$scheme://$path';
  }
}

void cascadePlayground() {
  final url = UrlBuilder()
    ..scheme = 'https'
    ..host = 'dart.dev'
    ..routes = [
      'guides',
      'language',
      'language-tour#cascade-notation-',
    ];

  print(url);
}

  // You can even use this operator with objects not designed to be builders.
  final largest = [342, 23423, 53, 232, 534]
    ..insert(0, 10)
    ..sort((a, b) => a.compareTo(b));

  print('The largest number in the list is ${largest.last}');
}
