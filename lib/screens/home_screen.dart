import 'package:flutter/material.dart';
import '../utils/local_storage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _latestAffirmation = 'No affirmation saved yet';

  @override
  void initState() {
    super.initState();
    _loadLatestAffirmation();

    // Listen to the affirmation stream for live updates
    LocalStorage.affirmationStream.listen((newAffirmation) {
      setState(() {
        _latestAffirmation = newAffirmation;
      });
    });
  }

  void _loadLatestAffirmation() async {
    String? latestAffirmation = await LocalStorage.getLatestAffirmation();
    setState(() {
      _latestAffirmation = latestAffirmation ?? 'No affirmation saved yet';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness Home'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Saved Affirmation:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              _latestAffirmation,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/exercise'),
              child: Text('Start Exercise'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/affirmation'),
              child: Text('View Affirmations'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/progress'),
              child: Text('View Progress'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
