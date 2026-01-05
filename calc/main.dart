import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calculation.dart';

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

                colorScheme: .fromSeed(seedColor: Colors.deepPurple)
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page')
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
    int openBracket = 0;
    int closedBracket = 0;
    int numbracket = 0;
    int noDot = 0;
    TextEditingController controller = TextEditingController();
    String display = "asdf";
    String lastString = "";
    String lastCharacter = "";
    String str = "";
    bool isDot = false;

    @override
    Widget build(BuildContext context)
    {

        return Scaffold(
            appBar: AppBar(
                backgroundColor: CupertinoColors.black,
                title: Center(child: Text("Calculator", style: TextStyle(color: Colors.orange, fontSize: 40 /*fontWeight: FontWeight.bold*/)))
            ),
            body: Container(
                color: CupertinoColors.black,
                child: Column(
                    children: [

                        SizedBox(
                            height: 140,
                            width: double.infinity,

                            child: Padding(
                                padding: const EdgeInsets.only(top: 100),

                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                        display,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.orange
                                        )
                                    )
                                )
                            )
                        ),
                        Container(

                            color: Colors.black,
                            height: 100,
                            width: double.infinity,

                            child: TextField(
                                inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9*/()\-+\.=\C]'))
                                ],
                                cursorWidth: 1,
                                cursorHeight: 1,
                                maxLines: null,
                                expands: true,
                                controller: controller,
                                textAlign: TextAlign.right,
                                style: TextStyle(height: 3, color: Colors.orange, fontSize: 35),

                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: CupertinoColors.black,
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: double.infinity,
                                            color: CupertinoColors.black
                                        ),
                                        borderRadius: .circular(0)
                                    )

                                )
                            )
                        ),
                        Wrap(
                            runSpacing: 25,
                            children: [

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [buttonText("C"),
                                        buttonText("("),
                                        buttonText(")"),
                                        buttonText("←", icon: Icon(Icons.backspace))
                                    ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [buttonText("7"),
                                        buttonText("8"),
                                        buttonText("9"),
                                        buttonText("/")
                                    ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [buttonText("4"),
                                        buttonText("5"),
                                        buttonText("6"),
                                        buttonText("*")
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [buttonText("1"),
                                        buttonText("2"),
                                        buttonText("3"),
                                        buttonText("-")
                                    ]),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: [buttonText("0"),
                                        buttonText("."),
                                        buttonText("="),
                                        buttonText("+")
                                    ])
                            ]
                        )
                    ]
                )
            )
        );
    }
    void _display(String text)
    {
        if (display.isNotEmpty && RegExp(r'[0-9+-/*]').hasMatch(text))
        {
            controller.text = lastString;
            display = "";
        }
        if (text == "C")
        {
            controller.clear();
            display = controller.text;
            lastString = " ";
            openBracket = 0;
            closedBracket = 0;
            numbracket = 0;
            noDot = 0;
        }
        else if (text == "←")
        {
            if (controller.text.isNotEmpty)
            {
                if (str[str.length - 1] == '.')
                {
                    noDot--;
                }if (str[str.length - 1] == '(')
                {
                    openBracket--;
                }if (str[str.length - 1] == ')')
                {
                    closedBracket++;
                }if (RegExp(r'[+\-*/]').hasMatch(str[str.length - 1]))
                {
                    numbracket--;
                }

                controller.text =
                controller.text.substring(0, controller.text.length - 1);
            }
        }
        else if (text == '=')
        {
            print('asdf');
            display = calculation(controller.text);
            print(display);
            lastString = display;
        }
        else
        {
            if (RegExp(r'[+*/\.]').hasMatch(text) && RegExp(r'[*/+\.]').hasMatch(lastCharacter) || ( (lastCharacter == "(" ) && (text == '(' || RegExp(r'[+\-/*]').hasMatch(text))))
            {
            }
            else if (text == '(')
            {
                if (!(str[str.length - 1] == '(' && ( text == '(')))
                {
                    numbracket++;
                }

                controller.text += text;
                openBracket++;
                isDot = false;
            }
            else if (text == ')' && openBracket > closedBracket)
            {

                ++closedBracket;
                controller.text += text;
                isDot = false;

            }
            else
            {
                if (RegExp(r'[+\-/*]').hasMatch(text))
                {
                    numbracket++;
                    isDot = false;
                }
                if (text == '.' /*&& controller.text.isNotEmpty*/ && isDot == false && numbracket >= noDot)
                {

                    isDot = true;
                    controller.text += text;
                    noDot++;
                } else if (text != '.' && (text != ')' || text != '('))
                {
                    controller.text += text;
                }
            }
        }
        str = controller.text;
        lastCharacter = str[str.length - 1];
        setState(()
            {
            {}});
    }

    Widget buttonText(String text, {Widget? icon})
    {
        return Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: buttonColor(text),
                shape: BoxShape.circle
            ),
            // color:
            child: InkWell(onTap: () => _display(text),
                child: Center(
                    child: icon ?? Text(text, style: TextStyle(
                                fontSize: 40, color:
                                CupertinoColors.black,
                                fontWeight: FontWeight.bold
                            ))
                ))
        );
    }

    Color buttonColor(String text)
    {
        if (text == 'C') return Colors.red.shade500;
        if (text == '=') return Colors.green.shade50;
        if (text == '←') return Colors.blue.shade300;
        if (text == '(' || text == ')') return Colors.purpleAccent.shade400;
        if (RegExp(r'[/*\-+]').hasMatch(text)) return Colors.blue.shade300;
        return Colors.orange;
    }
}
