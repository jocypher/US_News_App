import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(text: const TextSpan(
          children: [
          TextSpan(
            text: "Flutter",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            )
          ),
          TextSpan(
            text: "News",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue
            )
          )
        ] )
        ),
      ),
    );
  }
}