import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

String calculation(String value) {
  List<String> output = postfix(value);
  if (output.isEmpty) return "Error";

  Decimal? val = calculator(output);
  if (val == null) return "Error";

  return val.toString();
}

List<String> postfix(String expression) {
  Map<String, int> precedence = {
    '+': 1,
    '-': 1,
    '*': 2,
    '/': 2,
    '^': 3
  };

  List<String> operators = [];
  List<String> output = [];
  String number = "";
  bool hasDecimal = false;

  for (int i = 0; i < expression.length; i++) {
    String ch = expression[i];
    if (ch == ' ') continue;

    if (ch == '-' && (i == 0 || '+-*/^('.contains(expression[i - 1]))) {
      number += '-';
      continue;
    }

    if ('0123456789'.contains(ch)) {
      number += ch;
    } else if (ch == '.') {
      if (hasDecimal) return [];
      hasDecimal = true;
      number += '.';
    } else {
      if (number.isNotEmpty) {
        output.add(number);
        number = "";
        hasDecimal = false;
      }

      if (ch == '(') {
        operators.add(ch);
      } else if (ch == ')') {
        while (operators.isNotEmpty && operators.last != '(') {
          output.add(operators.removeLast());
        }
        if (operators.isEmpty) return [];
        operators.removeLast();
      } else if ('+-*/^'.contains(ch)) {
        while (operators.isNotEmpty &&
            operators.last != '(' &&
            (precedence[ch]! < precedence[operators.last]! ||
                (precedence[ch] == precedence[operators.last] && ch != '^'))) {
          output.add(operators.removeLast());
        }
        operators.add(ch);
      } else {
        return [];
      }
    }
  }

  if (number.isNotEmpty) output.add(number);

  while (operators.isNotEmpty) {
    if (operators.last == '(') return [];
    output.add(operators.removeLast());
  }

  return output;
}

Decimal? calculator(List<String> postfix) {
  List<Decimal> stack = [];

  for (String token in postfix) {
    if (token.length == 1 && '+-*/^'.contains(token)) {
      if (stack.length < 2) return null;

      Decimal b = stack.removeLast();
      Decimal a = stack.removeLast();

      Decimal? result = simpleCalculator(a, b, token);
      if (result == null) return null;

      stack.add(result);
    } else {
      stack.add(Decimal.parse(token));
    }
  }

  if (stack.length != 1) return null;
  return stack.first;
}

Decimal? simpleCalculator(Decimal a, Decimal b, String op) {
  switch (op) {
    case '+':
      return a + b;

    case '-':
      return a - b;

    case '*':
      return a * b;

    case '/':
      if (b == Decimal.zero) return null;
      Rational r = a / b;
      return rationalToDecimal(r, precision: 20);

    case '^':
      if (b.scale != 0) return null;
      int power = b.toBigInt().toInt();
      if (power < 0) return null;

      Decimal result = Decimal.one;
      for (int i = 0; i < power; i++) {
        result *= a;
      }
      return result;
  }
  return null;
}

Decimal rationalToDecimal(Rational r, {int precision = 20}) {
  BigInt scaled =
      (r.numerator * BigInt.from(10).pow(precision)) ~/ r.denominator;
  return Decimal.fromBigInt(scaled).shift(-precision);
}
