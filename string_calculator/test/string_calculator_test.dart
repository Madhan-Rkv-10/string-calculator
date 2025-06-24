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
    test('Input: "//*\n1*25*3", Output: 29', () {
      expect(calculator.add('//*\n1*25*3'), 29);
    });
    test('throw exception for negative numbers ', () {
      expect(() => calculator.add('-1'), throwsA(isA<Exception>()));
    });
    test('throw exception for negative numbers and split by commas', () {
      expect(
        () => calculator.add('-1,-2'),
        throwsA(
          predicate((e) {
            final exception = e.toString();
            return exception.contains("-1") && exception.contains("-2");
          }),
        ),
      );
    });
    test("ignore if value is more than 1000 -> input: 2,1002  output : 2 ", () {
      expect(calculator.add("2,1002"), 2);
    });
    test(
      "Delimiters can be of any length  input://[***]\n1***2***3 output :6 ",
      () {
        expect(calculator.add("//[***]\n1***2***3"), 6);
      },
    );
    test("Allow multiple delimiters  input://[*][%]\n1*4%3 output :8 ", () {
      expect(calculator.add("//[*][%]\n1*4%3"), 8);
    });
    test(
      "Allow multiple delimiters with length longer than one char input : //[][%%]\n12%%3  output : 6",
      () {
        expect(calculator.add("//[][%%]\n1 2%%3"), 6);
      },
    );
  });
}
