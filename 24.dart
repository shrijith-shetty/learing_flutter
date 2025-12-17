import 'package:flutter/material.dart';
import 'package:learning/intro_page.dart';
import 'package:learning/splash_screen.dart';
import 'package:learning/value.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyRoomPage(),
    );
  }
}

RangeValues values = RangeValues(0, 100);

class MyRoomPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => MyRoomState();
}

class MyRoomState extends State<MyRoomPage>
{
  RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Jai krishna")),
        body : Center(
            child: RangeSlider(
              min: 0,          // ✅ REQUIRED
              max: 100,        // ✅ REQUIRED
              values: values,
              divisions: 100,
              activeColor: Colors.green,

              inactiveColor: Colors.green.shade100,
              labels: RangeLabels(

                values.start.toInt().toString(),
                values.end.toInt().toString(),
              ),
              onChanged: (newValue) {
                setState(() {
                  values = newValue;
                  print("${newValue.start}, ${newValue.end}");
                  setState(() {

                  });
                });
              },
            )

        )
    );
  }

}            
