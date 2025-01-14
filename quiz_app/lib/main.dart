import 'package:flutter/material.dart';
import 'package:quiz_app/components/gradient_container.dart';
import 'package:quiz_app/quiz_main.dart';

final List<Color> gradientColors = [
  Color(0xFF4A00E0), // Deep Purple
  Color(0xFF8E2DE2), // Lighter Purple
  Color(0xFFDA22FF), // Vivid Magenta
  Color(0xFFFA8BFF), // Light Pink
  Color(0xFFFFDEE9), // Soft Pink
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: GradientContainer(QuizMain(), colors: gradientColors),
      ),
    );
  }
}
