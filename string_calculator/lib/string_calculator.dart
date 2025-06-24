class StringCalculator {
  static final StringCalculator _instance = StringCalculator._();
  factory StringCalculator() => _instance;
  StringCalculator._();
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    final numberList = numbers.replaceAll("\n", ',').split(',');
    int sum = 0;
    for (String number in numberList) {
      int parsedNumber = int.tryParse(number) ?? 0;
      sum += parsedNumber;
    }
    return sum;
  }
}
