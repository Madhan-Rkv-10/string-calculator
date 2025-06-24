import 'package:string_calculator/string_calculator.dart';

void main(List<String> arguments) {
  final calculator = StringCalculator();
  print(calculator.add(''));
  print(calculator.add('1'));
  print(calculator.add('1,2,3'));
  print(calculator.add("1\n5\n7"));
}
