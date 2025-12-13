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
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: no1Controller,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: no2Controller,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    ElevatedButton(onPressed: (){
                        var no1 = int.parse(no1Controller.text.toString());
                        var no2 = int.parse(no2Controller.text.toString());
                        var sum = no1+no2;
                        result = "The sum of $no1 and $no2 is $sum";

                        setState(() {});
                    }, child: Text("Add")),

                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var sum = no1-no2;
                      result = "The Subtraction of $no1 and $no2 is $sum";

                      setState(() {});
                    }, child: Text("Sub")),

                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var sum = no1*no2;
                      result = "The Multiplication of $no1 and $no2 is ${sum}";

                      setState(() {});
                    }, child: Text("Mul")),

                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(no1Controller.text.toString());
                      var no2 = int.parse(no2Controller.text.toString());
                      var sum = no1/no2;
                      result = "The Division of $no1 and $no2 is ${sum.toStringAsFixed(2)}";

                      setState((){});
                    }, child: Text("Div")),
                    Container(
                      height: 21,
                    ),
                  ]
                ),
                Padding(padding: EdgeInsetsGeometry.all(21),child:Text("$result",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 21),))

              ],

            ),
          ),

        ),
      ),
    );
  }

}
