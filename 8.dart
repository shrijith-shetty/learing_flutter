import 'package:flutter/material.dart';
import 'package:learning/uiHelper/uiHelper.dart';

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
        textTheme: TextTheme(
          headlineSmall:TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
          headlineMedium:TextStyle(fontSize: 10,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
        )
      ),
      home: const HomePage(),
    );
  }
}
var emailText = TextEditingController();
var password = TextEditingController();

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Starter"),
        backgroundColor: Colors.red,
      ),
    body:Center(child: Container(

      width:300,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextField(
            keyboardType: TextInputType.phone,
            controller: emailText,
          decoration: InputDecoration(
            // labelText: 'email',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(21),
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 2,
              )
            ),          //if we are using focus then no use of border
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),
                borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2,
                )
            ),
            suffixText: 'Email',
            suffixIcon: IconButton(
              icon: Icon(Icons.remove_red_eye,color: Colors.black,),
              onPressed: () {

              },

            ),
              // enabled: false,

            prefixIcon: Icon(Icons.email,color: Colors.green,),
            disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(21),
              borderSide: BorderSide(
                color: Colors.lightGreenAccent,
                width: 3,
              )
            )

            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(21),
            //   borderSide: BorderSide(
            //     color: Colors.deepOrange,
            //   )
            // )
          ),

        ),

        Container(
          height:10,
        ),
          TextField(
            obscureText: true,
            obscuringCharacter: '*',
            controller: password,

            decoration: InputDecoration(
              hintText: 'Password',
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),
                borderSide: BorderSide(
                  color: Colors.green
                )
              )
            ),
          ),
          ElevatedButton(onPressed: (){
            String email = emailText.text.toString();
            String Pass = password.text;
            print("Email $email, Password $Pass");
          },
            child:Text(
              'login'
            )
          )
        ]
      ),
    ))
    );
  }
}
