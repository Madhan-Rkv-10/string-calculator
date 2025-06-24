class StringCalculator {
  static final StringCalculator _instance = StringCalculator._();
  factory StringCalculator() => _instance;
  StringCalculator._();
  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    String delimiter = ',';
    if (numbers.startsWith('//')) {
      delimiter = numbers.substring(2, numbers.indexOf('\n'));
      numbers = numbers.substring(numbers.indexOf('\n') + 1);
    }
    final numberList = numbers.split(RegExp('[$delimiter\n]'));
    int sum = 0;
    List<int> negativeNumbers = [];
    for (String number in numberList) {
      int parsedNumber = int.tryParse(number) ?? 0;
      if (parsedNumber < 0) {
        negativeNumbers.add(parsedNumber);
      } else {
        sum += parsedNumber;
      }
    }

    if (negativeNumbers.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed : ${negativeNumbers.join(',')}',
      );
    }

    return sum;
  }
}
