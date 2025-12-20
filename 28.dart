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
            body: Center(

                child: Container(

                    child: InkWell(
                        onTap: ()
                        {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
                        },
                        child: Hero(
                            tag: 'background',
                            child: Image.asset('assets/dataflow.png', width: 100, height: 100)
                        ),
                    )
                )
            )
        );
    }
}
