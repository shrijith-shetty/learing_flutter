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
      body: Center(
        // child: ConstrainedBox(
          // constraints: BoxConstraints(
          //   minHeight: 20,
          //   minWidth: 200,
          //   maxHeight: 50,
          //   maxWidth: 400,
          // ),
          child: SizedBox.square(
            // height: 50,
            // width: 200,
            dimension: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Click"),
            ),
          ),
        ),
      // ),
    );
  }
}


          child:SizedBox.fromSize(
          // size: sizeOf,

          size: const ui.Size(200, 100),

          child: ElevatedButton(onPressed: (){

          },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.yellow
              ),
              child: Text('Click')),
        )
