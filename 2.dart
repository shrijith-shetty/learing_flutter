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
      body : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Expanded(
            flex: 2,
            child: Container(
              // width: 50,
              height:double.infinity,
              color: Colors.lightBlue,
            ),
          ),
          Expanded(
            flex:2,
            child: Container(
              // width: 100,
              height: double.infinity,
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
            flex:2,
            child: Container(
              // width: 50,
              height: double.infinity,
              color:Colors.grey,
            ),
          ),
          Expanded(
            flex:2,
            child: Container(
              // width: 50,
              height: double.infinity,
              color:Colors.black,
            ),
          )
        ]
      )
    );
  }
}
