import 'package:decimal/decimal.dart';


String calculation(String text)
{
    List<String> value = postfix(text);
    String val = calculator(value);
    print(val);
    if (val != "")
    {
      return val;
    }
   return "";
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
        number = '-$number';
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
          // print("expression is wrong");
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
        // print("wrong expression");
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
      // print("Wrong Expression");
      return [];
    }
    exp.add(characters.removeLast());
  }

  return exp;
}

String calculator(List<String> expression)
{
  String output = "";
  List<String> val = [];

  for (int i = 0; i < expression.length; i++)
  {
    String token = expression[i];

    if (['+', '-', '*', '/', '^'].contains(token))
    {
      if (val.length < 2)
      {
        // print("Invalid expression");
        return "";
      }

      Decimal num2 = Decimal.parse(val.removeLast());
      Decimal num1 = Decimal.parse(val.removeLast());
      output = simpleCalculator(num1, num2, token);

      if (output == "")
      {
        // print("Can not divide by '0'");
        return "";
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
    return "";
  }

  return (val.last).toString();
}

String simpleCalculator(Decimal values, Decimal values2, String character)
{
  if (character == '+')
  {
    return (values + values2).toStringAsFixed(2);
  }
  else if (character == '-')
  {
    return (values - values2).toStringAsFixed(2);
  }
  else if (character == '*')
  {
    return (values * values2).toStringAsFixed(2);
  }
  else if (character == '/')
  {
    if (values2 == 0.0 )
    {
      // print("Not Possible");
      return "";
    }
    return (values / values2).toString();
  }
  // else if (character == '^')
  // {
  //   return pow(values, values2).toStringAsFixed(2);
  // }

  // print("Invalid expression");
  return "";
}
