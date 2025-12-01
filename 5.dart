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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Starter"),
        backgroundColor: Colors.red,
      ),
      body:Center(
      child:CircleAvatar(
        radius: 40,
        backgroundColor: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assetts/sahydari.png', width: 30, height: 30),
            Text('Name', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),



          // child:Container(
          //   width: 300,
          //   height: 300,
          //   color: Colors.black12,
          //   child: CircleAvatar(
          //
          //     child:Text('Sahyadri',style:TextStyle(color: Colors.black,fontSize: 40)),
          //   backgroundImage: AssetImage('assetts/sahydari.png'),
          //   backgroundColor: Colors.grey,
          //   ),

      )
    );
  }
}
