import 'package:flutter/material.dart';
import 'package:quiz_app/components/gradient_container.dart';
import 'package:quiz_app/quiz_main.dart';

final List<Color> gradientColors = [
  Colors.deepPurple, // Tím đậm
  Colors.purple, // Tím sáng hơn
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
