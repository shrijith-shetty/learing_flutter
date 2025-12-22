import 'package:flutter/material.dart';
import 'package:learning/intro_page.dart';
import 'package:learning/splash_screen.dart';
import 'package:learning/value.dart';

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
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
                useMaterial3: false
            ),
            home: MyRoomPage()
        );
    }
}

class MyRoomPage extends StatefulWidget
{

    @override
    State<StatefulWidget> createState() => MyRoomState();
}

class MyRoomState extends State<MyRoomPage>
{
  List<Map<String, Object>> arrData= [
    {"name": "Alpha", "mobile": "9876543210", "unread": 3},
    {"name": "Beta", "mobile": "9123456789", "unread": 0},
    {"name": "Gamma", "mobile": "9988776655", "unread": 7},
    {"name": "Delta", "mobile": "9012345678", "unread": 1},
    {"name": "Epsilon", "mobile": "9345678123", "unread": 5},

    {"name": "John", "mobile": "9567890123", "unread": 2},
    {"name": "Alex", "mobile": "9789012345", "unread": 9},
    {"name": "Chris", "mobile": "9890123456", "unread": 4},
    {"name": "Sam", "mobile": "9678901234", "unread": 0},
    {"name": "Taylor", "mobile": "9456789012", "unread": 6},
    {"name": "Morgan", "mobile": "9321098765", "unread": 1},

    {"name": "UserOne", "mobile": "9001112223", "unread": 8},
    {"name": "UserTwo", "mobile": "9002223334", "unread": 0},
    {"name": "UserThree", "mobile": "9003334445", "unread": 2},
    {"name": "UserFour", "mobile": "9004445556", "unread": 10},

    {"name": "ItemA", "mobile": "9111111111", "unread": 3},
    {"name": "ItemB", "mobile": "9222222222", "unread": 6},
    ];
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Jai krishna")
            ),
            body: Container(
                color: Colors.blue,
                width: double.infinity,
                height: 200,
                child: ListView(

                  // scrollDirection: Axis.horizontal,
                  children: arrData.map((value)=>

                      ListTile(

                    leading:Icon(Icons.account_circle),
                    title : Text(value['name'].toString()),
                    subtitle : Text(value['mobile'].toString()),

                    trailing:CircleAvatar(
                        radius: 11,
                        backgroundColor: Colors.green,
                        child: Text(value['unread'].toString())),
                )
            ).toList(),
                    // children: arrData.map((value)
                    //     {
                    //         return Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Container(
                    //                 decoration: BoxDecoration(
                    //
                    //                     color: Colors.blue.shade200,
                    //                     borderRadius: BorderRadiusGeometry.circular(21)
                    //                 ),
                    //
                    //                 // child: Center(child: Text(value, style: TextStyle(fontSize: 21)))
                    //             )
                    //         );
                    //     }
                    // ).toList()
                )
            )
        );
    }

}
