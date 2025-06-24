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
      delimiters = [];
      int index = 0;
      while (index < delimiterString.length) {
        if (delimiterString[index] == '[') {
          int endDelimiterIndex = delimiterString.indexOf(']', index);
          delimiters.add(
            delimiterString.substring(index + 1, endDelimiterIndex),
          );
          index = endDelimiterIndex + 1;
        } else {
          delimiters.add(delimiterString[index]);
          index++;
        }
      }
      numbers = numbers.substring(endIndex + 1);
    }
    for (String delimiter in delimiters) {
      numbers = numbers.replaceAll(delimiter, ',');
    }
    numbers = numbers.replaceAll('\n', ',');
    List<String> numberList = numbers
        .split(',')
        .where((s) => s.isNotEmpty)
        .toList();

    int sum = 0;
    List<int> negativeNumbers = [];
    for (String number in numberList) {
      int parsedNumber = int.tryParse(number) ?? 0;
      if (parsedNumber < 0) {
        negativeNumbers.add(parsedNumber);
      } else if (parsedNumber <= 1000) {
        sum += parsedNumber;
      }
    }

    if (negativeNumbers.isNotEmpty) {
      throw Exception(
        'Negative numbers not allowed: ${negativeNumbers.join(', ')}',
      );
    }

    return sum;
  }
}
