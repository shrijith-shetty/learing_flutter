import 'dart:io';
import 'dart:math';

void main()
{
  String? expression = "";
  while (true)
  {
    expression = stdin.readLineSync();

    List<String> value = postfix(expression!);
    double? val = calculator(value);
    if (val != null)
    {
      print(val.toStringAsFixed(2));
    }
  }
}

List<String> postfix(String expression)
{
  Map<String, int> map =
  {
    '+': 1,
    '-': 1,
    '*': 2,
    '/': 2,
    '^': 3
  };

  List<String> characters = [];
  List<String> exp = [];
  String number = "";

  for (int i = 0; i < expression.length; i++)
  {
    if (expression[i] == ' ') continue;

    if (expression[i] == '-' &&
        (i == 0 || '+-*/^('.contains(expression[i - 1])))
    {
      if (number.startsWith('-'))
      {
        number = number.substring(1);
      }
      else
      {
        number = '-' + number;
      }
      continue;
    }


    if (['0','1','2','3','4','5','6','7','8','9'].contains(expression[i]) ||
        expression[i] == '.')
    {
      number += expression[i];
    }
    else
    {
      if (number.isNotEmpty)
      {
        exp.add(number);
        number = "";
      }

      if (expression[i] == '(')
      {
        if (i > 0 &&
            ('0123456789.'.contains(expression[i - 1]) ||
                expression[i - 1] == ')'))
        {
          characters.add('*');
        }
        characters.add('(');
      }
      else if (expression[i] == ')')
      {
        while (characters.isNotEmpty && characters.last != '(')
        {
          exp.add(characters.removeLast());
        }
        if (characters.isEmpty)
        {
          print("expression is wrong");
          return [];
        }
        characters.removeLast();
      }
      else if (['+','-','*','/','^'].contains(expression[i]))
      {
        while (characters.isNotEmpty &&
            characters.last != '(' &&
            map[expression[i]]! <= map[characters.last]!)
        {
          exp.add(characters.removeLast());
        }
        characters.add(expression[i]);
      }
      else
      {
        print("wrong expression");
        return [];
      }
    }
  }

  if (number.isNotEmpty)
  {
    exp.add(number);
  }

  while (characters.isNotEmpty)
  {
    if (characters.last == '(')
    {
      print("Wrong Expression");
      return [];
    }
    exp.add(characters.removeLast());
  }

  return exp;
}

double? calculator(List<String> expression)
{
  double? output = 0;
  List<String> val = [];

  for (int i = 0; i < expression.length; i++)
  {
    String token = expression[i];

    if (['+', '-', '*', '/', '^'].contains(token))
    {
      if (val.length < 2)
      {
        print("Invalid expression");
        return null;
      }

      double num2 = double.parse(val.removeLast());
      double num1 = double.parse(val.removeLast());
      output = simple_calculator(num1, num2, token);

      if (output == null)
      {
        print("Can not divide by '0'");
        return null;
      }

      val.add(output.toString());
    }
    else
    {
      val.add(token);
    }
  }

  if (val.isEmpty)
  {
    return 0;
  }

  return double.parse(val.last);
}

double? simple_calculator(double values, double values2, String chareters)
{
  if (chareters == '+')
  {
    return values + values2;
  }
  else if (chareters == '-')
  {
    return values - values2;
  }
  else if (chareters == '*')
  {
    return values * values2;
  }
  else if (chareters == '/')
  {
    if (values2 == 0)
    {
      print("Not Possible");
      return null;
    }
    return values / values2;
  }
  else if (chareters == '^')
  {
    return pow(values, values2).toDouble();
  }

  print("Invalid expresion");
  return null;
}
