// import 'dart:nativewrappers/_internal/vm/lib/async_patch.dart';
import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning/intro_page.dart';

class SplashScreen extends StatefulWidget
{
    @override
    State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 5), ()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroPage()));
    });
  }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Colors.blue,
            body: Center(

                child: Text("Classico", style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)))
        );
    }
}
