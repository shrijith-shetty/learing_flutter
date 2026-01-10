import 'dart:async';

import 'package:calc/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpashScreen extends StatefulWidget
{

    @override
    State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen>
{
    @override
    void initState()
    {
        super.initState();
        Timer(Duration(microseconds: 3), ()
            {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Flutter")));
            });
    }
    @override
    Widget build(BuildContext context) 
    {
        // TODO: implement build
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Icon(Icons.calculate, color: Colors.orange, size: 200),
                // SizedBox(height: 0,),
                Text("Calculator", style: TextStyle(fontSize: 42, color: Colors.orange))
            ]
        );
    }
}
