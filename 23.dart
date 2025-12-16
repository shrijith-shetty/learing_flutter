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
      home: SplashScreen(),
    );
  }
}

class MyRoomPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MyRoomState();
}

class MyRoomState extends State<MyRoomPage>
{
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Jai krishna")),
     body:Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("DashBoard Screen",style: TextStyle(fontSize: 24),),
           TextField(
             controller: no1Controller,
           ),
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Value(value : no1Controller.text)),);
           }, child: Text("Profile"))
         ],
       ),
     ),
    );
  }

}




// value.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Value extends StatefulWidget
{
  var value;

  // final dynamic value;

  Value({super.key,  this.value});
  @override
  State<StatefulWidget> createState() => _Value();

}

class _Value extends State<Value>
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Value'),
     ),
     body: Center(
       child: Text("Welcome, ${widget.value}",style: TextStyle(fontSize: 30),),
     ),
   );
  }

}




