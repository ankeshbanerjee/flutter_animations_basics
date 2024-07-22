import 'package:animations_basics/animation_1.dart';
import 'package:animations_basics/animation_2.dart';
import 'package:animations_basics/animation_3.dart';
import 'package:animations_basics/animation_4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ExplicitAnimation(),
        ),
      ),
    );
  }
}
