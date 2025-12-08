  import 'dart:ffi';
  import 'dart:ffi' as ffi;
  import 'dart:ui' as ui;
  import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          body:Container(
            width: double.infinity,
            height : double.infinity,
            color: Colors.grey,
            // height: ,
            child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    bottom: 100,
                    // left: 100,
                    // right: 100,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                    ),
                  )
                ],
            ),
          )

      );
    }
  }
