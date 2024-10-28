import 'package:flutter/material.dart';
import '../utils/local_storage.dart';

class AffirmationScreen extends StatefulWidget {
  @override
  _AffirmationScreenState createState() => _AffirmationScreenState();
}

class _AffirmationScreenState extends State<AffirmationScreen> {
  final List<String> _affirmations = [
    "I am capable of achieving my goals.",
    "I am worthy of love and respect.",
    "I believe in my skills and talents.",
    "I am resilient and can overcome challenges.",
    "I am grateful for the positive things in my life.",
    "I trust in my ability to succeed.",
    "I am becoming the best version of myself.",
    "I am calm, confident, and focused.",
    "I attract positivity and good energy.",
    "I am in control of my own happiness.",
    "I embrace my strengths and talents.",
    "I am worthy of all the wonderful things life has to offer.",
    "I am growing and improving every day.",
    "I choose peace and harmony in my life.",
    "I am grateful for the love and support around me.",
    "I am a positive thinker and attract positivity into my life.",
    "I have the power to create change.",
    "I am proud of all my achievements, big and small.",
    "I am surrounded by abundance and prosperity.",
    "I am enough, just as I am."
  ];
  int _currentIndex = 0;

  void _nextAffirmation() {
    setState(() {
      if (_currentIndex < _affirmations.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousAffirmation() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  void _startOver() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void _saveAffirmation() async {
    String affirmation = _affirmations[_currentIndex];
    await LocalStorage.saveAffirmation(affirmation);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Affirmation saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Affirmations')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _affirmations[_currentIndex],
              style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _previousAffirmation,
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _saveAffirmation,
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: _nextAffirmation,
                  child: Text('Next'),
                ),
              ],
            ),
            if (_currentIndex == _affirmations.length - 1)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: _startOver,
                  child: Text('Start Over'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
