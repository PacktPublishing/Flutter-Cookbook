main(List<String> arguments) {
  String text = 'Do not fail';
  print(text.length);

  final list = [1, 2, 3, 4];
  final lastValue = list.last;
  print(lastValue);

  overflowSum(0);
}

int overflowSum(int value) {
  if (value > 100) {
    return value;
  }

  print(value);
  return overflowSum(value + 1);
}
