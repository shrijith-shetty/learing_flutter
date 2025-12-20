import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flag = false;
  var myOpacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(opacity: myOpacity, duration: Duration(seconds: 2),
              curve: Curves.elasticIn,
              child:  Container(
                width: 200,
                height: 100,
                color : Colors.blue,
              ),
            ), //curve: by defualt linear animation
            ElevatedButton(onPressed: (){
                // myOpacity = 0.0;
                if(flag)
                  {
                    myOpacity=0.0;
                    flag = false;
                  }
                else{
                  flag = true;
                  myOpacity = 1.0;
                }
              setState(() {

              });
            }, child: Text('Click here'))
          ],
        ),
      ),
    );
  }
}
