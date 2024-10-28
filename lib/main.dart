import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/exercise_screen.dart';
import 'screens/affirmation_screen.dart';
import 'screens/progress_screen.dart'; // Add this line
import 'screens/settings_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mindfulness App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HomeScreen(),
      routes: {
        '/exercise': (context) => ExerciseScreen(),
        '/affirmation': (context) => AffirmationScreen(),
        '/progress': (context) => ProgressScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
