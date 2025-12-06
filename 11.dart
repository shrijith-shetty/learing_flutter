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
    body:Column(
      children: [
        Stack(
          children: [
              Container (
                height: 200,
                width: 200,
                color: Colors.grey,
              ),
            Positioned(

              left: 10,
              right: 10,

              child: Container(
                height: 120,
                width: 120,
                color: Colors.green,
              ),
            )
          ],
        ),
      ],
    )
    );
  }
}
