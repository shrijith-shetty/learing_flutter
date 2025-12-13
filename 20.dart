import 'package:flutter/material.dart';

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
      body:ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 150,
            maxWidth: 2000,
            maxHeight: 1000,
            minHeight: 500,
          ),
          child: ElevatedButton(onPressed: (){

          }, child:Text("CLick here")),
          // child: Text("Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello",style: TextStyle(fontSize: 21,overflow: TextOverflow.fade),)),
      ));
  }

}
