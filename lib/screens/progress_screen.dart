import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project01/utils/local_storage.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double exerciseProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadExerciseProgress();
  }

  Future<void> _loadExerciseProgress() async {
    double progress = await LocalStorage.getExerciseProgress();
    setState(() {
      exerciseProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Progress'),
        backgroundColor: Colors.purple.shade800, // Darker purple for the app bar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.purple.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Exercise Progress',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for better visibility
                ),
              ),
              SizedBox(height: 8),
              LinearPercentIndicator(
                lineHeight: 14.0,
                percent: exerciseProgress,
                center: Text(
                  '${(exerciseProgress * 100).toInt()}%',
                  style: TextStyle(color: Colors.black), // Black text for percentage
                ),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.purple,
                backgroundColor: Colors.white, // White background for the bar
              ),
            ],
          ),
        ),
      ),
    );
  }
}
