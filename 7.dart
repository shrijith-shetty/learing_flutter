import 'package:flutter/material.dart';
import 'package:learning/uiHelper/uiHelper.dart';

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
        textTheme: TextTheme(
          headlineSmall:TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
          headlineMedium:TextStyle(fontSize: 10,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
        )
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
      child:Card(
        elevation: 7,
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              color: Colors.orange,
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.white70,

            ),          Container(
              width: 40,
              height: 40,
              color: Colors.green,

            ),
          ],
        ),
      )
    )
    );
  }
}
