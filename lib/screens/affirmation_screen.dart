import 'package:flutter/material.dart';
import '../utils/local_storage.dart';

class AffirmationScreen extends StatelessWidget {
  final List<String> affirmations = [
    'You are strong and capable.',
    'Focus on the present moment.',
    'You are enough just as you are.',
    'You are worthy of all good things.',
    'Your potential is limitless.',
    'Embrace the journey, even the difficult parts.',
    'You have the power to create change.',
    'Today is a new opportunity to grow.',
    'Your mind is clear, your soul is peaceful.',
    'Trust in your abilities and be proud of yourself.',
    'You are resilient and will overcome this.'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daily Affirmations')),
      body: ListView.builder(
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(affirmations[index]),
            trailing: IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                LocalStorage.saveAffirmation(affirmations[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
