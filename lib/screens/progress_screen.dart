
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  double exerciseProgress = 0.7; // Example completion of 70%
  double affirmationProgress = 0.5; // Example completion of 50%

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Progress'), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Exercise Progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            LinearPercentIndicator(
              lineHeight: 14.0,
              percent: exerciseProgress,
              center: Text('${(exerciseProgress * 100).toInt()}%'),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.purple,
            ),
            SizedBox(height: 24),
            Text('Affirmation Progress', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            LinearPercentIndicator(
              lineHeight: 14.0,
              percent: affirmationProgress,
              center: Text('${(affirmationProgress * 100).toInt()}%'),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.purpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
