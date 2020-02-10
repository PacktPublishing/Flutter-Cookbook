import 'dart:math';

void main() {
  buildSortedRandomList();
}

void buildSortedRandomList({int length = 10}) {
  final randomized = <int>[];
  final random = Random();

  for (int i = 0; i < length; i++) {
    randomized.add(random.nextInt(100));
  }

  randomized.sort((a, b) {
    return a < b ? -1 : 1;
  });

  print(randomized);
}
