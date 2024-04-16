import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Color(0xff99baff),
        body: SafeArea(
          child: Stack( // Use Stack to position elements on top of each other
            children: [
              // Centered content with logo and text
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Assets/library-icon.webp',
                            height: 100,
                          ),
                          Text(
                            "LibNotif.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Positioned button above the bottom navigation bar
              Positioned(
                bottom: 100.0, // Adjust spacing from bottom as needed
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          // Navigate to a new screen named "SecondScreen"
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
