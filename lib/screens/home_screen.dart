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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Add your background image here
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54, // Semi-transparent background for better text visibility
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Today\'s Affirmation:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _latestAffirmation,
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  // Buttons with style and spacing
                  _buildStyledButton(
                    context, 
                    label: 'Start Exercise', 
                    onPressed: () => Navigator.pushNamed(context, '/exercise')
                  ),
                  SizedBox(height: 16),
                  _buildStyledButton(
                    context, 
                    label: 'View Affirmations', 
                    onPressed: () => Navigator.pushNamed(context, '/affirmation')
                  ),
                  SizedBox(height: 16),
                  _buildStyledButton(
                    context, 
                    label: 'View Progress', 
                    onPressed: () => Navigator.pushNamed(context, '/progress')
                  ),
                  SizedBox(height: 16),
                  _buildStyledButton(
                    context, 
                    label: 'Settings', 
                    onPressed: () => Navigator.pushNamed(context, '/settings')
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStyledButton(BuildContext context, {required String label, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple.shade700, // Button background color
        foregroundColor: Colors.white, // Button text color
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
