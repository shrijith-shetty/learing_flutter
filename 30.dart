import 'dart:async';
import 'package:animation_container/open_file.dart';
import 'package:flutter/material.dart';

void main()
{
    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: false
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page')
        );
    }
}

class MyHomePage extends StatefulWidget
{
    const MyHomePage({super.key, required this.title});
    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
    var arrIndex = [
      1,2,3,4,5,5,6,7,8,9,10,11,12,13,14
    ];
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary
            ),
            body : Container(
              color: Colors.black,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(20),topRight: Radius.circular(30)),
                    child : Image.asset('assets/dataflow.png',width: 300,height:200,fit: BoxFit.fill,),
                    // child: Container(
                    //   height: 200,
                    //   width: 200,
                    //   color: Colors.grey,
                    // ),
                  ),
              ),
            ),
        );
    }
}
