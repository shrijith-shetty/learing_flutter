import 'package:flutter/material.dart';
import 'package:learning/uiHelper/uiHelper.dart';
import 'package:intl/intl.dart';

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
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
        ),
      ),
      home: const HomePage(), // Use only ONE HomePage
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime time = DateTime.now(); // store time here

  @override
  Widget build(BuildContext context) {

    List<Color> arrColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.brown,
      Colors.cyan,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Starter"),
        backgroundColor: Colors.red,
      ),

      body: GridView.builder( itemBuilder: (context,index){
        return Container(color : arrColors[index],);
      }, itemCount: arrColors.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11,
      mainAxisExtent: 100,
      ),
      ),


      // children: [
      //   GridView.count(crossAxisCount: 5,
      //   crossAxisSpacing: 11,
      //   mainAxisSpacing: 11,
      //     children: [
      //       Container(color:arrColors[0]),
      //       Container(color:arrColors[1]),
      //       Container(color:arrColors[2]),
      //       Container(color:arrColors[3]),
      //       Container(color:arrColors[4]),
      //       Container(color:arrColors[5]),
      //       Container(color:arrColors[6]),
      //       Container(color:arrColors[7]),
      //       Container(color:arrColors[0]),
      //       Container(color:arrColors[6]),
      //
      //
      //
      //     ],
      //   ),
      //
      //   Container(
      //     height: 200,
      //   ),

   // body: GridView.extent(
   //              maxCrossAxisExtent: 100,
   //              crossAxisSpacing: 11,
   //              mainAxisSpacing: 11,
   //              children: [
   //                Container(color: arrColors[0]),
   //                Container(color: arrColors[1]),
   //                Container(color: arrColors[2]),
   //                Container(color: arrColors[3]),
   //                Container(color: arrColors[4]),
   //                Container(color: arrColors[5]),
   //                Container(color: arrColors[6]),
   //                Container(color: arrColors[7]),
   //                Container(color: arrColors[0]),
   //                Container(color: arrColors[6]),
   //              ],
   //            ),

      // body : Container(
    //   width: 200,
    //   child: GridView.count(crossAxisCount: 5,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[0]),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[1]),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[2]),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[3]),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[4]),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[5]),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[6]),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(color:arrColors[7]),
    //       ),
    //     ],
    //   ),
    // )
    );
  }
}

