import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: const Text("Name"),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 300,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  label: const Text("Password"),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Login"),
              onPressed: () async {
                if (nameController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty) {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool(SplashScreenState.KEY_LOGIN, true);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const HomePage(title: "Home Page"),
                    ),
                  );
                } else {
                  setState(() {
                    result = "⚠ Enter name and password!";
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            Text(result, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
