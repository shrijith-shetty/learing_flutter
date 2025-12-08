import 'dart:ffi';
import 'dart:ffi' as ffi;
import 'dart:ui' as ui;


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
        body : Center(
          child: Icon(
            Icons.password,
            size: 100,
            color: Colors.grey,
          ),
        )

    );
  }
}
