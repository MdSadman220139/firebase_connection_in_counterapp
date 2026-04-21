import 'package:firebase_connection_in_counterapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class getxImplementation extends StatelessWidget {
  const getxImplementation({super.key});

  @override
  //build function
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          backgroundColor: Colors.green,
          centerTitle: true,

        ),
        body: const HomeScreen()
      ),

    );
  }
}