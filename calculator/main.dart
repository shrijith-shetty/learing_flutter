import 'package:calculator/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)
            ),
            home:  Calculator()
        );
    }
}

class MyHomePage extends StatefulWidget
{
    const MyHomePage({super.key, required this.title});

    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
    TextEditingController num1 = TextEditingController();
    TextEditingController num2 = TextEditingController();
    String result = "";
    @override
    Widget build(BuildContext context)
    {

        return Scaffold(
            appBar: AppBar(

                backgroundColor: Theme.of(context).colorScheme.inversePrimary,

                title: Text(widget.title)
            ),
            body: Center(
                child: Container(
                  color: Color(0xff0D0D0D),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                  
                          Container(
                              width: 300,
                              decoration: BoxDecoration(
                  
                                  color: Color(0xff121212),
                                  // color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.orange, width: 2)
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Enter the value",
                                      border: InputBorder.none,
                                      focusColor: Colors.blue
                                  ),
                                  controller: num1,
                                  style: const TextStyle(
                                      color: Colors.white
                                  )
                              )
                  
                          ),
                          SizedBox(height: 12),
                          Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0xff121212),
                                  borderRadius: BorderRadiusGeometry.circular(12),
                                  border: Border.all(color: Colors.orange, width: 2)
                              ),
                              child: TextField(
                                  decoration: InputDecoration(
                                      hintText: "Enter the value",
                                      border: InputBorder.none
                  
                                  ),
                                  controller: num2,
                                  style: TextStyle(
                                      color: Colors.white
                                  )
                              )
                          ),
                          SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(onPressed: ()
                                          {
                                              if (num1.text.isNotEmpty && num2.text.isNotEmpty)
                                                  result = output(num1, num2, '+');
                                              setState(()
                                                  {
                  
                                                  });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              foregroundColor: Colors.orange,
                                              side: BorderSide(color: Colors.orange,width: 2),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadiusGeometry.circular(12)
                                              )
                                          )
                                          , child: Icon(Icons.add))
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(onPressed: ()
                                          {
                                              if (num1.text.isNotEmpty && num2.text.isNotEmpty)
                                                  result = output(num1, num2, '-');
                                              setState(()
                                                  {
                  
                                                  });
                                          },style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          side: BorderSide(color: Colors.orange,width: 2),
                                          foregroundColor: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusGeometry.circular(12)
                                          )
                                      )
                  
                                          , child: Icon(Icons.remove))
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(onPressed: ()
                                          {
                                              if (num1.text.isNotEmpty && num2.text.isNotEmpty)
                                                  result = output(num1, num2, '*');
                                              setState(()
                                                  {
                  
                                                  });
                                          },

                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                          foregroundColor: Colors.orange,
                                          side: BorderSide(color: Colors.orange,width: 2),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusGeometry.circular(12)
                                          )
                                      )
                  
                                          , child: Icon(CupertinoIcons.multiply))
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(onPressed: ()
                                          {
                  
                                              if (num1.text.isNotEmpty && num2.text.isNotEmpty)
                                                  result = output(num1, num2, '/');
                                              setState(()
                                                  {
                  
                                                  });
                  
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0Xff1A1A1A),
                                              side: BorderSide(color: Colors.orange,width: 2),
                                            foregroundColor: Colors.orange,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusGeometry.circular(12)
                                            )
                                          )
                  
                                          , child: Icon(CupertinoIcons.divide)
                  
                                      )
                                  )
                  
                              ],
                  
                  
                          ),
                        SizedBox(
                          height: 13,
                        ),
                        Text("${result}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                  
                      ]
                  ),
                )
            )
        );
    }

}

String output(TextEditingController num1, TextEditingController num2, String sign)
{
    String out = "";
    if (sign == '+')
    {
        double n1 = double.parse(num1.text);
        double n2 = double.parse(num2.text);
        double value = n1 + n2;
        return "Result is ${value}";
    }
    else if (sign == '-')
    {
        double n1 = double.parse(num1.text);
        double n2 = double.parse(num2.text);
        double value = n1 - n2;
        return "Result is ${value}";
    }

    else if (sign == '*')
    {
        double n1 = double.parse(num1.text);
        double n2 = double.parse(num2.text);
        double value = n1 * n2;
        return "Result is ${value}";
    }

    else if (sign == '/')
    {
        double n1 = double.parse(num1.text);
        double n2 = double.parse(num2.text);
        if (n2 != 0) 
        {
            double value = n1 / n2;
            return "Result is ${(value.toStringAsFixed(2))}";
        }else {
          return "Can't divide by zero";
        }
    }
    return "";
}

