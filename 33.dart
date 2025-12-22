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

  late AnimationController animationController;
  late Animation<double> animation = const AlwaysStoppedAnimation(0.0);

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 0.0, end: 200.0)
        .animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jai Krishna"),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.blue,
        ),
      ),
    );
  }
}
