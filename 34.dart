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
      home: MyRoomPage(),
    );
  }
}

class MyRoomPage extends StatefulWidget {
  const MyRoomPage({super.key});

  @override
  State<MyRoomPage> createState() => MyRoomState();
}

class MyRoomState extends State<MyRoomPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  final List<double> listRadius = [100, 150, 200, 250, 300];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat(); // 🔥 REQUIRED for ripple
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ripple Effect")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: listRadius.map((radius) {
            final size = radius * (_animation.value + 0.1);

            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(
                  (1.0 - _animation.value).clamp(0.0, 1.0),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
