class StringCalculator {
  static final StringCalculator _instance = StringCalculator._();
  factory StringCalculator() => _instance;
  StringCalculator._();

  final Map<String, OperationType> operationMap = {
    "*": OperationType.multiplication,
    "+": OperationType.addition,
  };

  int add(String numbers) {
    if (numbers.isEmpty) return 0;
    OperationType operationType = OperationType.addition;
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

    if (delimiters.length > 1) {
      for (String delimiter in delimiters) {
        numbers = numbers.replaceAll(delimiter, ',');
        operationType = OperationType.addition;
      }
    } else {
      operationType = operationMap[delimiters.first] ?? OperationType.addition;
    }

    for (String delimiter in delimiters) {
      numbers = numbers.replaceAll(delimiter, ',');

      if (delimiter.isNotEmpty) {
        if (delimiter.contains("*")) {
          operationType = OperationType.multiplication;
        } else {
          operationType = OperationType.addition;
        }
      }
    }
    numbers = numbers.replaceAll('\n', ',');
    List<String> numberList = numbers
        .split(',')
        .where((s) => s.isNotEmpty)
        .toList();

    int sum = (operationType == OperationType.multiplication) ? 1 : 0;
    List<int> negativeNumbers = [];
    print("numberslist${numberList.length}");
    for (String number in numberList) {
      int parsedNumber = int.tryParse(number) ?? 0;
      if (parsedNumber < 0) {
        negativeNumbers.add(parsedNumber);
      } else if (parsedNumber <= 1000) {
        if (operationType == OperationType.multiplication) {
          sum = sum * parsedNumber;
        } else {
          sum += parsedNumber;
        }
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

enum OperationType { addition, multiplication }
