import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _currentStep = 0;
  final List<String> _steps = [
    'Take a deep breath...',
    'Hold your breath...',
    'Slowly exhale...',
    'Close your eyes and focus on your breathing.',
    'Visualize a place where you feel completely relaxed.',
    'Stretch your arms and let go of any tension.',
    'Focus on your senses: What can you smell, hear, and feel?',
    'Tense your muscles, then release to feel the relaxation spread.',
    "Push-ups: Upper body strength",
    "Squats: Lower body workout",
    "Lunges: Leg and glute strength",
    "Burpees: Full-body cardio",
    "Jumping jacks: Cardio warm-up",
    "Plank: Core strength builder",
    "Mountain climbers: Core and cardio",
    "Bicycle crunches: Abs workout",
    "High knees: Cardio boost",
    "Glute bridges: Glutes and hamstrings",
    "Downward Dog: Stretch and relax",
    "Child's Pose: Restful stretch",
    "Warrior II: Leg and balance",
    "Tree Pose: Balance and focus",
    "Cat-Cow Stretch: Spine flexibility",
    "Bridge Pose: Back and glutes",
    "Triangle Pose: Side stretch",
    "Seated Forward Bend: Hamstring stretch",
    "Boat Pose: Core strength",
    'Repeat the process...'];

  void _nextStep() {
    setState(() {
      _currentStep = (_currentStep + 1) % _steps.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mindfulness Exercise')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_steps[_currentStep], style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextStep,
              child: Text('Next Step'),
            ),
          ],
        ),
      ),
    );
  }
}
