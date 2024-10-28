import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mindfulness Home'), backgroundColor: Colors.purple),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
