import 'package:flutter/material.dart';
import '../screens/notification_service.dart'; // Adjust the import to your structure
import '../utils/local_storage.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TimeOfDay exerciseReminderTime = TimeOfDay(hour: 8, minute: 0);
  TimeOfDay affirmationReminderTime = TimeOfDay(hour: 9, minute: 0);

  @override
  void initState() {
    super.initState();
    NotificationService.initialize();
    _loadReminderTimes();
  }

  Future<void> _loadReminderTimes() async {
    final savedExerciseTime = await LocalStorage.getExerciseStep(); // Get the saved exercise time
    final savedAffirmationTime = await LocalStorage.getExerciseStep(); // Get the saved affirmation time

    if (savedExerciseTime != null) {
      exerciseReminderTime = TimeOfDay.fromDateTime(DateTime.parse(savedExerciseTime.toString()));
    }
    if (savedAffirmationTime != null) {
      affirmationReminderTime = TimeOfDay.fromDateTime(DateTime.parse(savedAffirmationTime.toString()));
    }
  }

  Future<void> _selectTime(BuildContext context, bool isExerciseReminder) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isExerciseReminder ? exerciseReminderTime : affirmationReminderTime,
    );
    if (picked != null) {
      setState(() {
        if (isExerciseReminder) {
          exerciseReminderTime = picked;
          LocalStorage.saveExerciseStep(picked.hour); // Save the hour for exercise reminder
        } else {
          affirmationReminderTime = picked;
          LocalStorage.saveExerciseStep(picked.hour); // Save the hour for affirmation reminder
        }
      });
      _scheduleNotification(picked, isExerciseReminder);
    }
  }

  Future<void> _scheduleNotification(TimeOfDay time, bool isExerciseReminder) async {
    final now = DateTime.now();
    DateTime scheduledTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(Duration(days: 1));
    }

    NotificationService.showNotification(
      isExerciseReminder ? 'Exercise Reminder' : 'Affirmation Reminder',
      'Time for your ${isExerciseReminder ? 'exercise' : 'affirmation'}!',
    );
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
