import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        // print("asdf");
        // print(MediaQuery.of(context).size.width);
        // print(MediaQuery.of(context).size.height);
        return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            child: MaterialApp(
                builder: (context, child)
                {
                    return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                            textScaleFactor: 1.0
                        ),
                        child: child!
                    );
                },
                home: const MyHomePage(title: 'Flutter Demo Home Page')
            )
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
    final FocusNode keyboardFocus = FocusNode();
    final FocusNode textFieldFocus = FocusNode();
    int openBracket = 0;
    int closedBracket = 0;
    int operatorCount = 0;
    int noDot = 0;
    TextEditingController controller = TextEditingController();
    String display = "";
    String lastString = "";
    String lastCharacter = "";
    String str = "";
    bool isDot = false;
    bool isEntered = false;

    @override
    void initState()
    {
        super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_)
            {
                keyboardFocus.requestFocus();
            });
    }
    @override
    void dispose()
    {
        controller.dispose();
        keyboardFocus.dispose();
        textFieldFocus.dispose();
        super.dispose();
    }
    @override
    Widget build(BuildContext context)
    {
        bool isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        return Scaffold(

            appBar: AppBar(

                backgroundColor: CupertinoColors.black,
                title: Center(child: Text("Calculator", style: TextStyle(color: Colors.orange, fontSize: isPortrait ? 40.sp : 20.sp /*fontWeight: FontWeight.bold*/))),
                centerTitle: true

            ),
            body: RawKeyboardListener(focusNode: keyboardFocus,
                autofocus: false,

                onKey: (event)
                {
                    if (event is! RawKeyDownEvent || event.repeat) return;
                    // if () return;
                    final limitedOperator =
                        {
                            (LogicalKeyboardKey.asterisk),
                            (LogicalKeyboardKey.slash),
                            (LogicalKeyboardKey.add),
                            (LogicalKeyboardKey.minus),
                            (LogicalKeyboardKey.parenthesisLeft),
                            (LogicalKeyboardKey.parenthesisRight)

                        };

                    final operators =
                        {
                            (LogicalKeyboardKey.digit0),
                            (LogicalKeyboardKey.digit1),
                            (LogicalKeyboardKey.digit2),
                            (LogicalKeyboardKey.digit3),
                            (LogicalKeyboardKey.digit4),
                            (LogicalKeyboardKey.digit5),
                            (LogicalKeyboardKey.digit6),
                            (LogicalKeyboardKey.digit7),
                            (LogicalKeyboardKey.digit8),
                            (LogicalKeyboardKey.digit9)
                        };
                    if (isEntered && (limitedOperator.contains(event.logicalKey) || operators.contains(event.logicalKey)))
                    {
                        display = "";
                        lastString += event.logicalKey.keyLabel;
                        controller.text = lastString;
                        isEntered = false;
                    }
                    else if (event.isKeyPressed(LogicalKeyboardKey.enter) || event.isKeyPressed(LogicalKeyboardKey.equal))
                    {
                        _display("=");
                        isEntered = true;
                    }

                    WidgetsBinding.instance.addPostFrameCallback((_)
                        {
                            keyboardFocus.requestFocus();
                        }
                    );

                },
                child: OrientationLayout(
                    portrait: portrait(),
                    landscape: landScape()
                )

            )
        );
    }
    void _display(String text)
    {
        if (display.isNotEmpty && RegExp(r'[0-9+-/×]').hasMatch(text))
        {
            if (display == "Error")
            {
                display = "";
            }
            else
            {
                controller.text = lastString;
                display = "";
            }
        }

        if (text == "C")
        {
            display = "";
            controller.clear();
            lastString = "";
            openBracket = 0;
            closedBracket = 0;
            operatorCount = 0;
            noDot = 0;
            setState(()
                {});
        }
        else if (text == "←")
        {
            if (controller.text.isNotEmpty)
            {
                final text = controller.text;
                if (text.isNotEmpty && text.endsWith('.'))
                {
                    noDot--;
                }if (text.isNotEmpty && text.endsWith('('))
                {
                    openBracket--;
                }if (text.endsWith(')'))
                {
                    closedBracket--;
                }if (RegExp(r'[+\-×/]').hasMatch(str[str.length - 1]))
                {
                    operatorCount--;
                }

                controller.text =
                controller.text.substring(0, controller.text.length - 1);
            }
        }
        else if (text == '=')
        {
            display = calculation(controller.text);
            lastString = display;
        }
        else
        {
            if (RegExp(r'[+×/.]').hasMatch(text) && RegExp(r'[×/+.]').hasMatch(lastCharacter) || ( (lastCharacter == "(" ) && (text == '(' || RegExp(r'[+\-/×]').hasMatch(text))))
            {
            }
            else if (text == '(')
            {
                if (str.isNotEmpty && !(str[str.length - 1] == '(' && ( text == '(')))
                {
                    operatorCount++;
                }

                controller.text += text;
                openBracket++;
                isDot = false;
            }
            else if (text == ')')
            {
                if (!(openBracket > closedBracket))
                {
                    return;
                }

                closedBracket++;
                controller.text += text;
                isDot = false;

            }
            else
            {
                if (RegExp(r'[+\-/×]').hasMatch(text))
                {
                    operatorCount++;
                    isDot = false;
                }
                if (text == '.' && !isDot /*&& operatorCount >= noDot*/)
                {

                    isDot = true;
                    controller.text += text;
                    noDot++;
                } else if (text != '.' && text != ')' && text != '(')
                {
                    controller.text += text;
                }
            }
        }
        str = controller.text;
        if (str.isNotEmpty)
        {
            lastCharacter = str[str.length - 1];
        }
        setState(()
            {
            {}
            }
        );
    }

    Widget buttonText(String text, {Widget? icon})
    {
        final double size;
        bool isPortrait =
            MediaQuery.of(context).orientation == Orientation.portrait;
        size = isPortrait ? 80.r : 70.r;

        return Container(

            width: size,
            height: size,
            decoration: BoxDecoration(
                color: buttonColor(text),
                shape: BoxShape.circle
            ),
            child: InkWell(onTap: () => _display(text),
                child: Center(
                    child: icon ?? Text(text, style: TextStyle(
                                fontSize: isPortrait ? 40.sp : 9.sp,
                                color: CupertinoColors.black,
                                fontWeight: FontWeight.bold
                            )
                        )
                )
            )
        );
    }

    Color buttonColor(String text)
    {
        if (text == 'C') return Colors.red.shade500;
        if (text == '=') return Colors.green.shade50;
        if (text == '←') return Colors.blue.shade300;
        if (text == '(' || text == ')') return Colors.purpleAccent.shade400;
        if (RegExp(r'[/×\-+]').hasMatch(text)) return Colors.blue.shade300;
        return Colors.orange;
    }
    Widget landScape()
    {
        return Container(
            color: CupertinoColors.black,
            child: Column(
                children: [

                    SizedBox(

                        height: 110.h,
                        width: double.infinity.w,

                        child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                reverse: true,
                                child: Text(
                                    display,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(

                                        fontSize: 13.sp,
                                        color: Colors.orange
                                    )
                                )
                            )
                        )
                    ),
                    Container(

                        color: Colors.black,
                        height: 110.h,
                        width: double.infinity.h,

                        child: TextField(
                            readOnly: true,
                            controller: controller,
                            focusNode: textFieldFocus,
                            inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9×/()\-+.]'))
                            ],
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.ltr,
                            cursorColor: Colors.orange,
                            cursorWidth: 3.h,
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.orange,
                                height: 1.2.h
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: CupertinoColors.black,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r)
                            )
                        )

                    ),

                    SizedBox(
                        width: 150.w,
                        child: Wrap(
                            runSpacing: 10.r,
                            children: [

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                        buttonText("7"),
                                        buttonText("8"),
                                        buttonText("9"),
                                        buttonText("/"),
                                        buttonText("C")

                                    ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                        buttonText("4"),
                                        buttonText("5"),
                                        buttonText("6"),
                                        buttonText("×"),
                                        buttonText("(")

                                    ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                        buttonText("1"),
                                        buttonText("2"),
                                        buttonText("3"),
                                        buttonText("-"),
                                        buttonText(")")

                                    ]
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                        buttonText("0"),
                                        buttonText("."),
                                        buttonText("="),
                                        buttonText("+"),
                                        buttonText("←", icon: Icon(Icons.backspace)
                                        )
                                    ]
                                )
                            ]
                        )
                    )
                ]
            )
        );
    }
    Widget portrait()
    {
        return Container(
            color: CupertinoColors.black,
            child: Column(
                children: [

                    SizedBox(
                        height: 85.h,
                        width: double.infinity.h,

                        child: Padding(
                            padding: const EdgeInsets.only(top: 50),

                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                reverse: true,
                                child: Text(
                                    display,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(

                                        fontSize: 30.sp,
                                        color: Colors.orange
                                    )
                                )
                            )
                        )
                    ),
                    Container(

                        color: Colors.black,
                        height: 100.h,
                        width: double.infinity.h,

                        child: TextField(
                            controller: controller,
                            focusNode: textFieldFocus,
                            inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9×/()\-+.]'))
                            ],
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.ltr,
                            cursorColor: Colors.orange,
                            cursorWidth: 3.h,
                            style: TextStyle(
                                fontSize: 35.sp,
                                color: Colors.orange,
                                height: 1.2.h
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: CupertinoColors.black,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r)
                            )
                        )
                    ),

                    Wrap(
                        runSpacing: 25.r,
                        children: [

                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    buttonText("C"),
                                    buttonText("("),
                                    buttonText(")"),
                                    buttonText("←", icon: Icon(Icons.backspace))
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    buttonText("7"),
                                    buttonText("8"),
                                    buttonText("9"),
                                    buttonText("/")
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    buttonText("4"),
                                    buttonText("5"),
                                    buttonText("6"),
                                    buttonText("×",/*icon:Icon(CupertinoIcons.asterisk_circle)×*/)
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    buttonText("1"),
                                    buttonText("2"),
                                    buttonText("3"),
                                    buttonText("-")
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: [
                                    buttonText("0"),
                                    buttonText("."),
                                    buttonText("="),
                                    buttonText("+")
                                ]
                            )
                        ]
                    )
                ]
            )
        );
    }
}

class OrientationLayout extends StatelessWidget
{
    const OrientationLayout({super.key, required this.portrait, required this.landscape});

    final Widget portrait;
    final Widget landscape;

    @override
    Widget build(BuildContext context)
    {

        return OrientationBuilder(builder: (context, orientation)
            {
                return orientation == Orientation.portrait ?
                    portrait :
                    landscape;
            }
        );
    }
}
