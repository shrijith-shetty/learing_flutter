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
        body: Center( // Centers the child widget in the middle of the screen
          child: RichText( // RichText allows displaying text with multiple styles
            text: TextSpan( // TextSpan contains the actual text + styling
              style: const TextStyle( // Default text style for all spans (unless overridden)
                color: Colors.grey, // Default text color (applies to all spans unless changed)
                fontSize: 21, // Default text size
              ),
              children: <TextSpan>[ // List of text segments with individual styles

                // 1️⃣ First part of the text (simple & uses default styling)
                const TextSpan(
                  text: 'Namaste ', // Plain grey text, size 21
                ),

                // 2️⃣ Second part: styled differently
                const TextSpan(
                  text: 'Jagathu ', // This part will be orange, bold, larger
                  style: TextStyle(
                    color: Colors.orange, // Overrides default grey color
                    fontWeight: FontWeight.bold, // Makes text bold
                    fontSize: 25, // Larger font size
                  ),
                ),

                // 3️⃣ Third part: back to default style
                const TextSpan(
                  text: 'Welcome to ', // Uses default grey, size 21
                ),

                // 4️⃣ Fourth part: styled separately
                const TextSpan(
                  text: 'Flutter ', // Blue, bold, biggest size
                  style: TextStyle(
                    color: Colors.blue, // Blue color
                    fontSize: 30, // Biggest size
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),

              ],
            ),
          ),
        )

    );
  }
}
