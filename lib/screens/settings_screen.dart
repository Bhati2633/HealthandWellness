import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TimeOfDay exerciseReminderTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay affirmationReminderTime = TimeOfDay(hour: 9, minute: 0);

  Future<void> _selectTime(BuildContext context, bool isExerciseReminder) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isExerciseReminder ? exerciseReminderTime : affirmationReminderTime,
    );
    if (picked != null) {
      setState(() {
        if (isExerciseReminder) {
          exerciseReminderTime = picked;
        } else {
          affirmationReminderTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Set Daily Reminders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              title: Text("Exercise Reminder: ${exerciseReminderTime.format(context)}"),
              trailing: Icon(Icons.alarm),
              onTap: () => _selectTime(context, true),
            ),
            ListTile(
              title: Text("Affirmation Reminder: ${affirmationReminderTime.format(context)}"),
              trailing: Icon(Icons.alarm),
              onTap: () => _selectTime(context, false),
            ),
            SizedBox(height: 20),
            Text("Enable these reminders in your phone's notification settings.", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
