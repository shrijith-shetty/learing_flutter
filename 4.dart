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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> arrNames  = const[
    'dog',
    'cat',
    'palnt',
    'cobra',
    'meaow',
    'man',
    'rat',
    'horse'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Starter"),
        backgroundColor: Colors.red,
      ),
      body : ListView.separated(itemBuilder: (context, index)
      {
        return ListTile(
          leading: Text("$index"),
          title:Text(arrNames[index]),
          subtitle: Text('Number'),
          trailing: Icon(Icons.add),
        );
      },
        itemCount:arrNames.length,
        separatorBuilder: (context,index) {
          return Divider(height: 10, thickness: 1,color: Colors.greenAccent, );
        }
      )
    );
  }
}
