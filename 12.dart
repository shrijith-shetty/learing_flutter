import 'package:flutter/material.dart';
import 'package:learning/widget/rounded_btn.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Starter"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(

          // alignment: WrapAlignment.spaceAround,
          // runSpacing: 11,
          direction: Axis.horizontal,
          // spacing:11,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.grey,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),

          ],
        ),
      ),
    );
  }
}
