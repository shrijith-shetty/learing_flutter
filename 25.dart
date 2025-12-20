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
  double _width = 200;
  double _height = 100;
  bool flag = true;

  Decoration myDecor = BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(6),
  );

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
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: myDecor,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInCirc,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (flag) {
                    _width = 100;
                    _height = 200;
                    myDecor = BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    );
                    flag = false;
                  } else {
                    _width = 200;
                    _height = 100;
                    myDecor = BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    );
                    flag = true;
                  }
                });
              },
              child: const Text("Animated button"),
            ),
          ],
        ),
      ),
    );
  }
}
