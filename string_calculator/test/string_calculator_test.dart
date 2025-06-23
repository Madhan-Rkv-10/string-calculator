import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  late StringCalculator calculator;
  setUp(() {
    calculator = StringCalculator();
  });
  group('StringCalculator', () {
    test('Input: "", Output: 0', () {
      expect(calculator.add(''), 0);
    });

    test('Input: "1", Output: 1', () {
      expect(calculator.add('1'), 1);
    });

    test('Input: "1,5", Output: 6', () {
      expect(calculator.add('1,2,3'), 6);
    });
  });
}
