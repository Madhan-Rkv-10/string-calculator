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
    test('Input: "1\n5", Output: 6', () {
      expect(calculator.add('1,\n5'), 6);
    });
    test('Input: "1\n5\n7", Output: 13', () {
      expect(calculator.add('1,\n5\n7'), 13);
    });
    test('Input: "//*\n1*25*3", Output: 29', () {
      expect(calculator.add('//*\n1*25*3'), 29);
    });
  });
}
