<h1>String Calculator</h1>

<h2>Overview</h2>
<p>This project is a simple string calculator that takes a string of numbers as input and returns their sum. The calculator supports various features such as handling unknown amounts of numbers, new lines between numbers, different delimiters, and ignoring numbers bigger than 1000.</p>

<h2>Features</h2>
<ul>
  <li>Handles up to two numbers, separated by commas</li>
  <li>Handles an unknown amount of numbers</li>
  <li>Supports new lines between numbers (instead of commas)</li>
  <li>Supports different delimiters</li>
  <li>Throws an exception when a negative number is passed</li>
  <li>Ignores numbers bigger than 1000</li>
  <li>Supports delimiters of any length</li>
  <li>Supports multiple delimiters</li>
  <li>Supports multiple delimiters with length longer than one character</li>
</ul>

<h2>Method Signature</h2>
<p>The calculator has a single method <code>add</code> with the following signature:</p>
<pre>int add(String numbers)</pre>

<h2>Usage</h2>
<p>To use the calculator, simply call the <code>add</code> method with a string of numbers as input. For example:</p>
<pre>
void main() {
  var calculator = StringCalculator();
  print(calculator.add('')); // prints 0
  print(calculator.add('1')); // prints 1
  print(calculator.add('1,2,3')); // prints 6
  print(calculator.add("1\n5\n7")); // prints 13
  print(calculator.add("//;\n1;2;5;3")); // prints 11
  print(calculator.add("//*\n1*25*3")); // prints 29
  try {
    print(calculator.add('1,-2,3')); // throws exception
  } catch (e) {
    print(e);
  }
  print(calculator.add("2,1001")); // prints 2
  print(calculator.add("//[***]\n1***2***3")); // prints 6
  print(calculator.add("//[*][%]\n1*4%3")); // prints 8
  print(calculator.add("//[][%%]\n12%%3")); // prints 15
}
</pre>

<h2>Implementation</h2>
<p>The calculator is implemented in Dart and uses regular expressions to parse the input string and extract the numbers. It also uses a list to store the delimiters and a loop to iterate over the numbers.</p>

<h2>Tests</h2>
<p>The calculator has been tested with various input scenarios, including:</p>
<ul>
  <li>Empty string</li>
  <li>Single number</li>
  <li>Multiple numbers</li>
  <li>New lines between numbers</li>
  <li>Different delimiters</li>
  <li>Negative numbers</li>
  <li>Numbers bigger than 1000</li>
  <li>Delimiters of any length</li>
  <li>Multiple delimiters</li>
  <li>Multiple delimiters with length longer than one character</li>
</ul>

<h2>Notes</h2>
<ul>
  <li>The calculator assumes that the input string is well-formed and does not contain any invalid characters.</li>
  <li>The calculator throws an exception when a negative number is passed, and the exception message includes the negative number(s).</li>
  <li>The calculator ignores numbers bigger than 1000.</li>
</ul>
