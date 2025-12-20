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

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
                backgroundColor: Theme.of(context).colorScheme.inversePrimary
            ),
            body: ListWheelScrollView(itemExtent: 100 , children:[
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
              Container(
                width: double.infinity,
                color : Colors.blue,
              ),
            ]),
        );
    }
}


// above is manual


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
            body: Center(
              child: ListWheelScrollView(

                  itemExtent: 100 ,
                  children:arrIndex.map((e)=> Padding(

                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      child:Center(child: Text("$e",style: TextStyle(fontSize: 30,color: Colors.red),)),
                      decoration: BoxDecoration(
                        color : Colors.blue,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: double.infinity,
                    ),
                  )).toList(),
              ),
            ),
        );
    }
}

