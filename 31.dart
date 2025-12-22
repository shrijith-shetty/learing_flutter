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
    var wtController = TextEditingController();
    var ftController = TextEditingController();
    var inController = TextEditingController();
    var result = "";
    var bgcolor = Colors.indigo.shade200;
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(

                backgroundColor: Colors.indigoAccent,
                title: Text(widget.title)
            ),
            body: Container(
              decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Color(0xfff68084),
                Color(0xffe0c3fc),
              ],
                center: AlignmentGeometry.center,
                stops: [0.6,0.9]
              ),
              ),

              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //       colors: [
              //         // Colors.orange.shade100,
              //         // Colors.purple.shade100
              //         Color(0xffa6c0fe),
              //         Color(0xfff68084)
              //       ],
              //     begin:FractionalOffset(1.0,0.0),
              //     end : FractionalOffset(0.0, 1.0),
              //     stops: [0.1,1]
              //
              //   )
              // ),
                // color: bgcolor,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text("BMI", style: TextStyle(fontSize: 34, color: Colors.black, fontWeight: FontWeight.bold)),
                            SizedBox(height: 14),
                            TextField(
                              autofocus: true,
                                controller: wtController,
                                decoration: InputDecoration(
                                    label: Text("Enter you Weight(in KG)"),
                                    prefixIcon: Icon(Icons.line_weight)
                                ),
                                keyboardType: TextInputType.number
                            ),
                            SizedBox(height: 14),

                            TextField(
                                controller: ftController,
                                decoration: InputDecoration(
                                    label: Text("Enter your height(in Feet)"),
                                    prefixIcon: Icon(Icons.height)
                                ),
                                keyboardType: TextInputType.number
                            ),
                            SizedBox(height: 14),
                            TextField(
                                controller: inController,
                                decoration: InputDecoration(
                                    label: Text("Enter your height(in inch)"),
                                    prefixIcon: Icon(Icons.height)
                                ),
                                keyboardType: TextInputType.number
                            ),

                            SizedBox(height: 14),

                            ElevatedButton(onPressed: ()
                                {
                                    var wt = wtController.text.toString();
                                    var ft = ftController.text.toString();
                                    var inch = inController.text.toString();

                                    if (wt != "" && ft != "" && inch != "") // it should not be empty
                                        {
                                            //BMI calculation
                                            var iwt = int.parse(wt);
                                            var ift = int.parse(ft);
                                            var Inch = int.parse(inch);

                                            var Tnch = (ift * 12) + Inch;
                                            var tCm = Tnch * 2.54;
                                            var tM = tCm / 100;
                                            var bmi = iwt / (tM * tM);
                                            var msg = "";
                                            if (bmi > 25)
                                            {
                                                msg = "You're Overweight";
                                                bgcolor = Colors.orange.shade200;
                                            }
                                            else if (bmi < 18)
                                            {
                                                msg = "You're Underweight";
                                                bgcolor = Colors.red.shade200;
                                            }
                                            else
                                            {
                                                msg = "You're Healthy";
                                                bgcolor =  Colors.green.shade100;
                                            }

                                            setState(()
                                                {
                                                    result = "$msg \n your BMI is ${bmi.toStringAsFixed(2)}";
                                                });
                                        }
                                    else
                                    {
                                        setState(()
                                            {
                                                result = "Please fill all the required blanks!!";
                                            });
                                    }
                                }, child: Text('Calculate')),
                            SizedBox(height: 12),
                            Text(result, style: TextStyle(fontSize: 19))
                        ]
                    )
                )
            )
        );
    }
}
