class StringCalculator {
  static final StringCalculator _instance = StringCalculator._();
  factory StringCalculator() => _instance;
  StringCalculator._();
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    List<String> delimiters = [','];
    if (numbers.startsWith('//')) {
      int endIndex = numbers.indexOf('\n');
      String delimiterString = numbers.substring(2, endIndex);
      delimiters = delimiterString
          .split(RegExp(r'\]\['))
          .map((delimiter) => delimiter.replaceAll('[', '').replaceAll(']', ''))
          .toList();
      numbers = numbers.substring(endIndex + 1);
    }

    numbers = numbers.replaceAll(RegExp('[${delimiters.join('')}\n]'), ',');
    List<String> numberList = numbers.split(',');

    int sum = 0;
    List<int> negativeNumbers = [];
    for (String number in numberList) {
      int parsedNumber = int.tryParse(number) ?? 0;
      if (parsedNumber < 0) {
        negativeNumbers.add(parsedNumber);
      } else {
        if (parsedNumber <= 1000) {
          sum += parsedNumber;
        }
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
