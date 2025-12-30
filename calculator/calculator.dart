import 'package:flutter/material.dart';
import 'package:calculator/calculation.dart';

class Calculator extends StatefulWidget
{
    const Calculator({super.key});

    @override
    State<Calculator> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<Calculator>
{
    String display = "";

    // Premium Color Theme
    final Color bgBlack = const Color(0xFF0D0D0D);
    final Color btnBlack = const Color(0xFF1A1A1A);
    final Color gold = const Color(0xFFD4AF37);
    final Color darkGold = const Color(0xFFC28E0E);

    void onButton(String value)
    {
        setState(()
            {
                if (value == "C")
                {
                    display = "";
                } else if (value == "⌫")
                {
                    if (display.isNotEmpty)
                    {
                        display = display.substring(0, display.length - 1);
                    }
                } else if (value == "=")
                {
                    if (display.isNotEmpty)
                    {
                        String exp = display.replaceAll("×", "*").replaceAll("÷", "/");
                        display = calculation(exp);
                    } else
                    {
                        display = "Nothing to Calculate";
                    }
                    return;
                } else
                {
                    display += value;
                }
            });
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: bgBlack,

            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calculate, color: Colors.orange, size: 35),
                  SizedBox(width: 0),
                  Text("CALCULATOR", style: TextStyle(color: Colors.orange, fontSize: 32)),
                ],
              ),
            ),



            body: Column(
                children: [
                    // Display Screen
                    Container(
                        width: double.infinity,
                        height: 150,
                        padding: const EdgeInsets.all(25),
                        alignment: Alignment.bottomRight,
                        color: bgBlack,
                        child: Text(
                            display,
                            maxLines: 1,
                            style: TextStyle(
                                color: gold,
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5
                            )
                        )
                    ),

                    const SizedBox(height: 25),

                    // Buttons Area
                    SingleChildScrollView(
                        child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: [
                                buildButton("C"),
                                buildButton("("),
                                buildButton(")"),
                                buildButton("⌫"),

                                buildButton("7"),
                                buildButton("8"),
                                buildButton("9"),
                                buildButton("÷"),

                                buildButton("4"),
                                buildButton("5"),
                                buildButton("6"),
                                buildButton("×"),

                                buildButton("1"),
                                buildButton("2"),
                                buildButton("3"),
                                buildButton("-"),

                                buildButton("0"),
                                buildButton("."),
                                buildButton("="),
                                buildButton("+")
                            ]
                        )
                    )
                ]
            )
        );
    }

    Widget buildButton(String text)
    {

        return Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: btnBlack,
                border: Border.all(
                    color: gold,
                    width:  1,
                ),
                boxShadow: const[
                    BoxShadow(color: Colors.black87, blurRadius: 8, offset: Offset(3, 3))
                ]
            ),

            child: ElevatedButton(
                onPressed: () => onButton(text),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: const CircleBorder(),
                    textStyle: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    )
                ),
                child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center
                )
            )
        );
    }
}
