import 'package:auto_size_text/auto_size_text.dart';
import 'package:calci/calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.black
                )
            )
        ),
        home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  final FocusNode keyboardFocus = FocusNode();
  final FocusNode textFieldFocus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  String display = "";
  String lastValue = "";
  bool resolution = false;

  @override
  void initState()
  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)
    {
      textFieldFocus.requestFocus();
    });
  }

  @override
  void dispose()
  {
    _controller.dispose();
    keyboardFocus.dispose();
    textFieldFocus.dispose();
    super.dispose();
  }
  void _display(String text)
  {
    setState(()
    {
      if (text == "C")
      {
        display = "";
        lastValue = "";
        _controller.clear();
        resolution = false;
        return;
      }

      if (text == "⌫")
      {
        if (_controller.text.isNotEmpty)
        {
          final currentText = _controller.text;
          final selection = _controller.selection;

          if (selection.start > 0)
          {
            final newText = currentText.substring(0, selection.start - 1) +
                currentText.substring(selection.start);
            _controller.value = TextEditingValue(
                text: newText,
                selection: TextSelection.collapsed(offset: selection.start - 1)
            );
          }
        }
        return;
      }

      if (text == "=")
      {
        if (_controller.text.isEmpty)
        {
          display = "nothing to calculate";
          resolution = true;
          return;
        }

        display = calculation(_controller.text);

        if (display != "Error")
        {
          lastValue = display;
        }

        resolution = true;
        return;
      }

      if (resolution && RegExp(r'[0-9.]').hasMatch(text))
      {
        _controller.value = TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: text.length)
        );
        display = "";
        resolution = false;
        return;
      }

      if (resolution && RegExp(r'[+\-*/]').hasMatch(text))
      {
        if (display == "Error" || display == "nothing to calculate") return;

        final newText = lastValue + text;
        _controller.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: newText.length)
        );
        display = "";
        resolution = false;
        return;
      }

      if (resolution && (text == "(" || text == ")"))
      {
        _controller.value = TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: text.length)
        );
        display = "";
        resolution = false;
        return;
      }

      final currentText = _controller.text;
      final selection = _controller.selection;
      final newText = currentText.substring(0, selection.start) +
          text +
          currentText.substring(selection.start);
      _controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: selection.start + text.length)
      );
    });
  }

  Color buttonColor(String text)
  {
    if (text == 'C') return Colors.red.shade500;
    if (text == '=') return Colors.green.shade50;
    if (text == '⌫') return Colors.blue.shade300;
    if (text == '(' || text == ')') return Colors.purpleAccent.shade400;
    if (RegExp(r'[/*\-+]').hasMatch(text)) return Colors.blue.shade300;
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(title: const Text("Calculator", style: TextStyle(color: Colors.orangeAccent, fontSize: 30)), backgroundColor: Colors.black),
        body: RawKeyboardListener(

            focusNode: keyboardFocus,
            autofocus: false,
            onKey: (event)
            {
              if (event is RawKeyDownEvent &&
                  (event.logicalKey == LogicalKeyboardKey.enter ||
                      event.logicalKey == LogicalKeyboardKey.equal))
              {
                _display("=");
                WidgetsBinding.instance.addPostFrameCallback((_)
                {
                  textFieldFocus.requestFocus();
                });
              }
            },

            child: Container(
                color: CupertinoColors.black,
                child: Column(
                    children: [
                      Container(
                          height: 140,
                          width: double.infinity,
                          color: Colors.black,
                          padding: const EdgeInsets.all(8),
                          child: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: SingleChildScrollView(
                                  reverse: true,
                                  scrollDirection: Axis.horizontal,
                                  child: AutoSizeText(
                                      display,
                                      style: TextStyle(
                                          color: Colors.orangeAccent
                                      ),
                                      textAlign: TextAlign.right,
                                      maxLines: 1,
                                      minFontSize: 30,
                                      maxFontSize: 50
                                  )
                              )
                          )
                      ),
                      SizedBox(
                          height: 150,
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextField(
                                  focusNode: textFieldFocus,
                                  controller: _controller,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9()+\-*/.]'))
                                  ],
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      color: Colors.orangeAccent,
                                      fontSize: 30),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.black,

                                      contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 40),
                                      border: OutlineInputBorder(

                                          borderRadius: BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                  )
                              )
                          )
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Wrap(

                                      spacing: 25,
                                      runSpacing: 25,
                                      children: [

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            key("C"),
                                            key("("),
                                            key(")"),
                                            key("⌫"),
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            key("7"),
                                            key("8"),
                                            key("9"),
                                            key("/"),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            key("4"),
                                            key("5"),
                                            key("6"),
                                            key("*"),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            key("1"),
                                            key("2"),
                                            key("3"),
                                            key("-"),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            key("0"),
                                            key("."),
                                            key("="),
                                            key("+")
                                          ],
                                        ),
                                      ]
                                  )
                              )
                          )
                      )
                    ]
                )
            )
        )
    );
  }

  Widget key(String text)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 11.0, right: 11.0),
      child: SizedBox(
          width: 75,
          height: 75,
          child: ElevatedButton(
              onPressed: () => _display(text),
              style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor(text),
                  shape: const CircleBorder(),
                  elevation: 4
              ),
              child: Text(
                  text,
                  style: TextStyle(
                      fontSize: text.length > 1 ? 26 : 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  )
              )
          )
      ),
    );
  }
}
